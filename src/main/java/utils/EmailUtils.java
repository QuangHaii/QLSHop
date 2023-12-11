package utils;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtils {
	// Email: haivietkieu2608@gmail.com
	// Password: leplpvigvjkfsrnk
	public int sendEmail(String destination) {
		final String email = "haivietkieu2608@gmail.com";
		final String password = "leplpvigvjkfsrnk";

		Properties properies = new Properties();
		properies.put("mail.smtp.host", "smtp.gmail.com");
		properies.put("mail.smtp.port", "465");
		properies.put("mail.smtp.auth", "true");
		properies.put("mail.smtp.starttls.enable", "true");
		properies.put("mail.smtp.starttls.required", "true");
		properies.put("mail.smtp.ssl.protocols", "TLSv1.2");
		properies.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(email,password);
			}
		};
		
		Session session = Session.getInstance(properies, auth);
		
		Random random = new Random();
		int OTPvalue = random.nextInt((999999 - 100000) + 1) + 100000;
		
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.setFrom(new InternetAddress(email));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destination,false));
			msg.setSubject("Confirm your account");
			msg.setText("Your OTP is "+OTPvalue,"UTF-8");
			
			Transport.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return OTPvalue;
	}
}

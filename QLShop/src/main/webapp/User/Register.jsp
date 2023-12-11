<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	type="text/javascript"></script>
<script>
	function validRegister() {
		var returnValue = false;
		if($("[name='fullName']").val() == ""){
			alert("Full name cannot be blank!");
			return returnValue;
		}
		if(!isNumeric($("[name='age']").val())){
			alert("Invalid age!");
			return returnValue;
		}
		if($("[name='password']").val() == ""){
			alert("Password cannot be blank!");
			return returnValue;
		} else if ($("[name='password']").val() != $("[name='confirm']").val()){
			alert("Password do not match!");
			return returnValue;
		}
		$.ajax({
			type : 'POST',
			url : 'Check',
			async: false,
			data : {
				username : $("[name='username']").val(),
			},
			success : function(result) {
				if(result==""){
					alert("Register success!")
					returnValue = true;
				}
				else{
					alert(result);
				}
			}
		});
		return returnValue;
	}
	function isNumeric(str) {
		  if (typeof str != "string") return false // we only process strings!  
		  return !isNaN(str) && // use type coercion to parse the _entirety_ of the string (`parseFloat` alone does not do this)...
		         !isNaN(parseFloat(str)) // ...and ensure strings of whitespace fail
		}
</script>

</head>
<body>
	<%@include file="/SharedLayout/User.jsp"%>
<body>
	<div class="row" style="place-content: center;">
		<div class="col-md-4" style="margin-top: 2em;">
			<form name="form" action="/QLShop/User/Register" method="post"
				onsubmit="return validRegister();">
				<h2>Create a new account.</h2>
				<hr />
				<div class="text-danger" role="alert"></div>
				<div class="form-floating mb-3">
					<input name="fullName" class="form-control" autocomplete="Fullname"
						aria-required="true" placeholder="name@example.com" /> <label>Full
						Name</label> <span class="text-danger"></span>
				</div>
				<div class="form-floating mb-3">
					<input name="age" class="form-control" autocomplete="Age"
						aria-required="true" placeholder="age" /> <label>Age</label> <span
						class="text-danger"></span>
				</div>
				<div class="form-floating mb-3">
					<input name="phone" class="form-control" autocomplete="Phone"
						aria-required="true" placeholder="phone number" /> <label>Phone
						Number</label> <span class="text-danger"></span>
				</div>
				<div class="form-floating mb-3">
					<input name="address" class="form-control" autocomplete="Address"
						aria-required="true" placeholder="address" /> <label>Address</label>
					<span class="text-danger"></span>
				</div>
				<div class="form-floating mb-3">
					<input name="email" class="form-control" autocomplete="Email"
						aria-required="true" placeholder="name@example.com" /> <label>Email</label>
					<span class="text-danger"></span>
				</div>
				<div class="form-floating mb-3">
					<input name="username" class="form-control"
						autocomplete="Username" aria-required="true"
						placeholder="username" /> <label>Username</label> <span
						class="text-danger"></span>
				</div>
				<div class="form-floating mb-3">
					<input name="password" class="form-control" type="password"
						autocomplete="new-password" aria-required="true"
						placeholder="password" /> <label>Password</label> <span
						class="text-danger"></span>
				</div>
				<div class="form-floating mb-3">
					<input name="confirm" class="form-control" type="password"
						autocomplete="new-password" aria-required="true"
						placeholder="password" /> <label>Confirm Password</label> <span
						class="text-danger"></span>
				</div>
				<button id="registerSubmit" type="submit"
					class="w-100 btn btn-lg btn-primary">Register</button>
			</form>
		</div>
		<!--  <div class="col-md-6 col-md-offset-2">
        <section>
            <h3>Use another service to register.</h3>
            <hr />
            @{
                if ((Model.ExternalLogins?.Count ?? 0) == 0)
                {
                    <div>
                        <p>
                            There are no external authentication services configured. See this <a href="https://go.microsoft.com/fwlink/?LinkID=532715">article
                            about setting up this ASP.NET application to support logging in via external services</a>.
                        </p>
                    </div>
                }
                else
                {
                    <form id="external-account" asp-page="./ExternalLogin" asp-route-returnUrl="@Model.ReturnUrl" method="post" class="form-horizontal">
                        <div>
                            <p>
                                @foreach (var provider in Model.ExternalLogins!)
                                {
                                    <button type="submit" class="btn btn-primary" name="provider" value="@provider.Name" title="Log in using your @provider.DisplayName account">@provider.DisplayName</button>
                                }
                            </p>
                        </div>
                    </form>
                }
            }
        </section>
    </div>
     -->
	</div>
</body>
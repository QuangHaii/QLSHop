<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="user" value="${sessionScope.User }"/>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	type="text/javascript"></script>
<script>
	function checkPassword() {
		if($("[name='oldPass']").val() != ${user.password} ){
			alert("Old password is not correct!");
			return false;
		}
		if($("[name='password']").val() == ""){
			alert("Password cannot be blank!");
			return false;
		} else if ($("[name='password']").val() != $("[name='confirm']").val()){
			alert("Password do not match!");
			return false;
		}
		alert("Change password success!!")
		return true;
	}
</script>
</head>
<body>
<%@include file="/SharedLayout/User.jsp" %>

<h1>Manage your account</h1>

<div>
    <h2>Change your account settings</h2>
    <hr />
    <div class="row">
        <div class="col-md-3">
            <partial name="_ManageNav" />
            <form id="profile-form" method="post">
            <ul class="nav navbar-nav">
            <li><a href="/QLShop/User/Profile" class="form-control" style="color: blue;">Edit Profile</a></li>
            <li><a href="/QLShop/User/ChangePassword" class="form-control" style="color: blue;">Change Password</a></li>
            <li><a href="/QLShop/User/OrderHistory" class="form-control" style="color: blue;">Order History</a></li>
            </ul>
            </form>
        </div>
        <div class="col-md-9">
        <div class="row">
    <div class="col-md-6">
    	<h1 style="font-size: 100;font-size: 3em;font-weight: bold;/* text-align-last: center; */color: black;">Change Password</h1>
        <form action="/QLShop/User/ChangePassword" method="post" onsubmit="return checkPassword();">
            <div class="text-danger" role="alert"></div>
            <div class="form-floating mb-3">
                <input type="password" name="oldPass" class="form-control" autocomplete="current-password" aria-required="true" placeholder="Please enter your old password." />
                <label class="form-label">Old Password</label>
                <span  class="text-danger"></span>
            </div>
            <div class="form-floating mb-3">
                <input type="password" name="password" class="form-control" autocomplete="new-password" aria-required="true" placeholder="Please enter your new password." />
                <label class="form-label">New Password</label>
                <span class="text-danger"></span>
            </div>
            <div class="form-floating mb-3">
                <input type="password" name="confirm" class="form-control" autocomplete="new-password" aria-required="true" placeholder="Please confirm your new password."/>
                <label class="form-label">Confirm Password</label>
                <span  class="text-danger"></span>
            </div>
            <button type="submit" class="w-100 btn btn-lg btn-primary">Update password</button>
        </form>
    </div>
</div>
            
        </div>
    </div>
</div>
</body>
</html>
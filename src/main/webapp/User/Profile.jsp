<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/SharedLayout/User.jsp" %>
<c:set var="user" value="${sessionScope.User }"/>
<h1>Manage your account</h1>

<div>
    <h2>Change your account settings</h2>
    <hr />
    <div class="row">
        <div class="col-md-3">
            <partial name="_ManageNav" />
            <form action="/QLShop/User/Profile" method="post">
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
    	<h1 style="font-size: 100;font-size: 3em;font-weight: bold;/* text-align-last: center; */color: black;">Profile</h1>
        <form id="profile-form" method="post">
            <div class="text-danger" role="alert"></div>
            <input type="hidden" name="userID" value="${user.userID }"/>
            <input type="hidden" name="username" value="${user.username }"/>
            <input type="hidden" name="password" value="${user.password }"/>
            <div class="form-floating mb-3">
                <input class="form-control" placeholder="Please choose your username." value="${user.username }" disabled />
                <label class="form-label">UserName</label>
            </div>
            <div class="form-floating mb-3">
            
                <input class="form-control" name="fullname" placeholder="Please choose your full name" value="${user.fullname }"/>
                <label class="form-label">Full Name</label>
            </div>
            <div class="form-floating mb-3">
      
                <input class="form-control" name="email" placeholder="Please choose your email" value="${user.email }" />
                <label class="form-label">Email</label>
            </div>
            <div class="form-floating mb-3">
    
                <input class="form-control" name="address" placeholder="Please choose your address" value="${user.address }"/>
                <label class="form-label">Address</label>
            </div>
            <div class="form-floating mb-3">
    
                <input class="form-control" name="age" placeholder="Please choose your age" value="${user.age }"/>
                <label class="form-label">Age</label>
            </div>
            <div class="form-floating mb-3">
      
                <input class="form-control" name="phone" placeholder="Please enter your phone number." value="${user.phone }"/>
                <label class="form-label">Phone number</label>
                <span class="text-danger"></span>
            </div>
            <button id="update-profile-button" type="submit" class="w-100 btn btn-lg btn-primary">Save</button>
        </form>
    </div>
</div>
            
        </div>
    </div>
</div>
</body>
</html>
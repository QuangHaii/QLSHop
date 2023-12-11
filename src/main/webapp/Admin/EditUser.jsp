<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/SharedLayout/Admin.jsp" %>
<div class="main-panel" style="
    align-items: center;">
<body>

    <div class="col-md-6" style="padding: 2em">
    	<h1 style="font-size: 100;font-size: 3em;font-weight: bold; text-align-last: center; color: black;">Edit User: ${user.username }</h1>
        <form name="/QLShop/User/Edit" method="post">
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
                <div class="form-floating mb-3">
                    <select name="roleID" class="form-select" aria-required="true">
                        <option value="1" <c:if test="${user.role.roleID == 1}"> selected </c:if> >Admin</option>
                        <option value="3" <c:if test="${user.role.roleID == 3}"> selected </c:if> >Staff</option>
                        <option value="2" <c:if test="${user.role.roleID == 2}"> selected </c:if> >Customer</option>
                    </select>
                </div>
                <button id="registerSubmit" type="submit" class="w-100 btn btn-lg btn-primary">Update</button>
            <!-- <button id="update-profile-button" type="submit" class="w-100 btn btn-lg btn-primary">Save</button> -->
        </form>
    </div>
</div>
     
</div>

</body>

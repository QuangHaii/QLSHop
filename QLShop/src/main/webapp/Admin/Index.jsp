<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/SharedLayout/Admin.jsp" %>
<div class="main-panel" style="padding: 1em">
<body>
<div class="card">
    <div class="card-body" style="background: white">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a>Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">All User</li>
            </ol>
        </nav>
        <div class="row">
            <div class="col-md-12 table-responsive-md" >
               
                <table class="table table-strip table" style="color: black;">
                    <thead>
                        <tr>
                            <th>User Name</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Age</th>
                            <th>Role</th>
                            <th class="text-warning">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${listUser}">
                    <tr>
                                <td>${user.username}</td>
                                <td>${user.fullname}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>${user.address }</td>
                                <td>${user.age }</td>
                                <td>${user.role.roleName }</td>
                                <td>
                                    <a class="text-primary" href="/QLShop/User/Edit?id=${user.userID}">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a class="text-danger" href="/QLShop/User/Delete?id=${user.userID}">
                                        <i class="far fa-trash-alt"></i> Delete
                                    </a>
                                </td>
                            </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
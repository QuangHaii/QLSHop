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

<section class="py-5">
    <div class="row" style="place-content: center;">
    <div class="col-md-4">
        <section>
            <form id="account" method="post">
                <h2>Use a local account to log in.</h2>
                <hr />
                <div class="text-danger" role="alert"></div>
                <div class="form-floating mb-3">
                    <input name="username" class="form-control" autocomplete="username" aria-required="true" placeholder="username" />
                    <label class="form-label">Username</label>
                    <span class="text-danger"></span>
                </div>
                <div class="form-floating mb-3">
                    <input name="password" class="form-control" autocomplete="current-password" aria-required="true" placeholder="password" type="password" />
                    <label class="form-label">Password</label>
                    <span class="text-danger"></span>
                </div>
                <!-- 
                <div class="checkbox mb-3">
                    <label asp-for="Input.RememberMe" class="form-label">
                        <input class="form-check-input" asp-for="Input.RememberMe" />
                        @Html.DisplayNameFor(m => m.Input.RememberMe)
                    </label>
                </div>
                 -->
                <div>
                    <button id="login-submit" type="submit" class="w-100 btn btn-lg btn-primary">Log in</button>
                </div>
                <div>
                    <p>
                        <a href="/QLShop/User/ForgotPassword">Forgot your password?</a>
                    </p>
                    <p>
                        <a href="/QLShop/User/Register">Register as a new user</a>
                    </p>
                </div>
            </form>
        </section>
    </div>
    <!-- 
    <div class="col-md-6 col-md-offset-2">
        <section>
            <h3>Use another service to log in.</h3>
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
</section>
</body>
</html>
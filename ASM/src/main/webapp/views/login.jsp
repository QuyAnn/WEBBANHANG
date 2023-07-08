<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../static/css/login.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Login</title>
</head>
<body>
<div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6 col-md-8 col-sm-10">
         
            <form:form id="loginForm" method="POST" modelAttribute="user" action="${pageContext.request.contextPath}">
              
              <h2 class="text-center mb-4" class="test">Wellcome</h2>
              
              <div class="form-group">
                <label for="username">Username:</label>
                <form:input type="text" class="form-control" id="username" path="username" placeholder="Enter username" />
                 <form:errors path="username" class="err" />
              </div>
              <div class="form-group">
                <label for="password">Password:</label>
                <div class="input-group">
                  <form:input type="password" class="form-control" id="password" path="password" placeholder="Enter password" />
                  <div class="input-group-append">
                    <span class="input-group-text">
                      <i id="showPasswordToggle" class="fas fa-eye"></i>
                    </span>
                  </div>
                </div>
                <span class="err">${message}</span>
                <form:errors path="password" class="err" />
              </div>
              <div class="form-group form-check">
                <input type="checkbox" path="rememberMe" >
                <label class="form-check-label" for="rememberMe">Remember me?</label>
              </div>
              <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Login</button>
              </div>
              <div class="form-group text-center">
                <a href="">Forgot password?</a>
              </div>
              <hr>
              <div class="form-group text-center">
                <button type="submit" class="btn btn-success">Register</button>
              </div>
            </form:form>
          </div>
        </div>
      </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>
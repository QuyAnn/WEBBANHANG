<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <header class="admin-header bg-dark">
        <nav class="navbar navbar-expand-lg navbar-dark">
          <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Admin Tools </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#adminNav" aria-controls="adminNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
    
            <div class="collapse navbar-collapse" id="adminNav">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/admin/user">Users</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/admin/product">Products</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/admin/category">Category</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Logout</a>
                </li>
                <li>
                    <a class="nav-link" href="#"><i class="fas fa-solid fa-user"></i>&nbsp ${userLog.fullname}</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/admin.css">
</head>
<body>
<jsp:include page="layout/headeradmin.jsp"></jsp:include>
 <section>
 <div class="container">
    <h1>Category Management</h1>
    <div class="success-message alert alert-success">
        <c:if test="${not empty successMessage}">
        ${successMessage}
        </c:if>
    </div>
    <div class="add-product">
      <h2>Add New Category</h2>
      <form:form modelAttribute="category" method="POST">
        <form:hidden path="id" placeholder="Category Id" class="input-field"/>
        <form:input path="name" placeholder="Category Name" class="input-field"/>
        <button type="submit" class="add-btn" formaction="${pageContext.request.contextPath}/admin/category/create">Add Product</button>
        <button type="submit" class="add-btn" formaction="${pageContext.request.contextPath}/admin/category/update">Update Product</button>
      </form:form>
    </div>
    <br><br>
    <table class="product-table">
      <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="item" items="${listct}">
        <tr>
          <td>${item.id}</td>
          <td>${item.name}</td>
          <td class="actiontable">
            <button class="edit-btn"><a href="${pageContext.request.contextPath}/admin/category/delete/${item.id}"><i class="fas fa-solid fa-trash"></i></a></button>
            <button class="delete-btn"><a href="${pageContext.request.contextPath}/admin/category/edit/${item.id}"><i class="fas fa-solid fa-info"></i></a></button>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    
  </div>
 
 </section>
<jsp:include page="layout/footeradmin.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>
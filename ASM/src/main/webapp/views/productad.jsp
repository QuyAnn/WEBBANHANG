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
    <h1>Product Management</h1>
    <div class="success-message alert alert-success">
  <c:if test="${not empty successMessage}">
    ${successMessage}
  </c:if>
</div>
    <div class="add-product">
      <h2>Add New Product</h2>
      <form:form modelAttribute="product" method="POST" enctype="multipart/form-data">
        <form:hidden path="id" placeholder="Product Id" class="input-field"/>
        <form:input path="name" placeholder="Product Name" class="input-field"/>
        <form:input path="price" placeholder="Price" class="input-field"/>
        <form:input path="image" type="file" class="input-field" placeholder="Image"/>
        <form:textarea path="description" placeholder="Product Description" class="input-field"/>
        <form:input path="quantity" class="input-field" placeholder="Quantity" />
        <form:label path="">Available:</form:label> <br>
        <form:radiobutton path="available" value="true"/> Active
        <form:radiobutton path="available"  value="false"/> No Active <br>
        <form:label path="">Category:</form:label> <br>
        <form:select path="category.id" class="input-field">
        <form:options items="${categories}" itemValue="id" itemLabel="name" />
        </form:select> <br> <br>
        <button type="submit" class="add-btn" formaction="${pageContext.request.contextPath}/admin/product/create">Add Product</button>
        <button type="submit" class="add-btn" formaction="${pageContext.request.contextPath}/admin/product/update">Update Product</button>
      </form:form>
    </div>
    
    <table class="product-table">
      <thead>
        <tr>
         
          <th>Product Name</th>
          <th>Price</th>
          <th>Image</th>
          <th>Description</th>
          <th>Quantity</th>
          <th>Date</th>
          <th>Available</th>
          <th>Category</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="item" items="${listpr}">
        <tr>
          <td>${item.name}</td>
          <td>${item.price}</td>
          <td> <img class="imgtable" src="/static/${item.image}"> </td>
          <td>${item.description}</td>
          <td>${item.quantity}</td>
          <td>
          <fmt:formatDate value="${item.createDate}" pattern="dd-MM-yyyy HH:mm"  var="formattedDate" />
          ${formattedDate}</td>
          <td>${item.available?"Actived":"No Actived"}</td>
          <td>${item.category.name}</td>
          <td class="actiontable">
            <button class="edit-btn"><a href="${pageContext.request.contextPath}/admin/product/delete/${item.id}"><i class="fas fa-solid fa-trash"></i></a></button>
            <button class="delete-btn"><a href="${pageContext.request.contextPath}/admin/product/edit/${item.id}"><i class="fas fa-solid fa-info"></i></a></button>
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
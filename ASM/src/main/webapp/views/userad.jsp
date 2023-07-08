<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <h1>User Management</h1>
    
    <table class="product-table">
      <thead>
        <tr>
          <th>User Name</th>
          <th>Password</th>
          <th>Fullname</th>
          <th>Email</th>
          <th>Image</th>
          <th>Activated</th>
          <th>Role</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
     <c:forEach var="item" items="${listad}">
        <tr>
          <td>${item.username}</td>
          <td>${item.password}</td>
          <td>${item.fullname}</td>
          <td>${item.email}</td>
          <td><img class="imgtable" src="/static/${item.image}"></td>
          <td>${item.activated?"Yes":"No"}</td>
          <td>${item.admin?"Admin":"User"}</td>
          <td class="actiontable">
          <button class="delete-btn"><a href="${pageContext.request.contextPath}/admin/user/delete/${item.username}"><i class="fas fa-solid fa-trash"></i></a></button>
            <button class="edit-btn"><a href="${pageContext.request.contextPath}/admin/user/edit/${item.username}"><i class="fas fa-solid fa-info"></i></a></button>
            
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="add-user">
      <h2>Add New User</h2>
      <form:form modelAttribute="user" method="POST" enctype="multipart/form-data">	
      
        <form:input  placeholder="User Name" class="input-field" path="username"/>
        <form:password placeholder="User password" class="input-field" path="password"/>
        <form:input path="fullname" class="input-field" placeholder="User fullname" />
        <form:input  placeholder="User Email" class="input-field" path="email"/>
        <form:input path="image" type="file" placeholder="User Image" class="input-field"/>
        <form:radiobutton path="admin" hidden="admin" value="true"/> 
        <form:radiobutton  hidden="user" path="admin" value="false"/> 
        <label for="">Activated:</label> <br>
        <form:radiobutton path="activated" value="true"/>Yes
        
        <form:radiobutton path="activated" value="false"/>No<br><br>
        <button type="submit" class="add-btn" formaction="${pageContext.request.contextPath}/admin/user/create">Add User</button>
        <button type="submit" class="add-btn" formaction="${pageContext.request.contextPath}/admin/user/update">Update User</button>
      </form:form>
    </div>
  </div>
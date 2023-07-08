<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header">
        <div class="container">
          <div class="row align-items-center">
            <div class="col">
              <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
              <a href="${pageContext.request.contextPath}/product/list">Sản phẩm</a>
              <a href="${pageContext.request.contextPath}/contact">Liên hệ</a>
              <a href="#">Thông tin</a>
            </div>
            <div class="col-auto">
              <div class="search-box">
                <input type="text" class="search-input" placeholder="Tìm kiếm...">
              </div>
            </div>
            <div class="col-auto">
              <div class="account">
              <c:choose>
              <c:when test="${sessionScope.currentUser.admin ==  true }">
                <a href="${pageContext.request.contextPath}/admin/user" style="color: #fff;">Admin Tool</a>
                
                </c:when>
                </c:choose>
                <span class="cart-icon"><a style="color: #fff;" href="${pageContext.request.contextPath}/product/cart"><i class="fas fa-shopping-cart"></i></a></span>
                &nbsp
                <div class="dropdown">
                
                  <button style="background-color: #8470FF;" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    ${userLog.fullname}&nbsp <img src="../static/${userLog.image}" alt="...">
                  </button>
                  
                  <ul class="dropdown-menu dropdown-menu-dark">
                    <li><a class="dropdown-item" href="#">Chỉnh sửa thông tin</a></li>
                    <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
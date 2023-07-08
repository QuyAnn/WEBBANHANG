
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/product.css">

</head>
<body>
<jsp:include page="layout/header.jsp" ></jsp:include>
 <section>
 <div class="container">
    <div class="product-detail">
        <div class="product-image">
          <img src="/static/${product.image}" alt="Product Image">
        </div>
        <div class="product-info">
          <h2 class="product-title">${product.name}</h2>
          <p class="product-description">${product.description}</p>
          <p class="product-price">$${product.price}</p>
          <button class="add-to-cart-btn">Add to Cart</button>
        </div>
      </div>
      <div class="related-products">
        <h3 class="section-title">Sản phẩm gợi ý</h3>
        <div class="product-list">
          <div class="product-card">
            <img src="https://shopdunk.com/images/thumbs/0008734_iphone-14-pro-128gb_240.png" alt="Product 1" class="product-image">
            <h4 class="product-name">Product 1</h4>
            <p class="product-price">$29.99</p>
            <button class="add-to-cart-btn">Add to Cart</button>
          </div>
          <div class="product-card">
            <img src="https://shopdunk.com/images/thumbs/0008734_iphone-14-pro-128gb_240.png" alt="Product 2" class="product-image">
            <h4 class="product-name">Product 2</h4>
            <p class="product-price">$39.99</p>
            <button class="add-to-cart-btn">Add to Cart</button>
          </div>
          <div class="product-card">
            <img src="https://shopdunk.com/images/thumbs/0008734_iphone-14-pro-128gb_240.png" alt="Product 3" class="product-image">
            <h4 class="product-name">Product 3</h4>
            <p class="product-price">$49.99</p>
            <button class="add-to-cart-btn">Add to Cart</button>
          </div>
        </div>
      </div>
    </div>
 </section>
<jsp:include page="layout/footer.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</body>
</html>



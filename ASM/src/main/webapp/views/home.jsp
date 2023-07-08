<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/index.css">
<style type="text/css">
.featured-product-card {
      border: 1px solid #eee;
      transition: box-shadow 0.3s;
    }

    .featured-product-card:hover {
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }

    .featured-product-card .card-title {
      font-size: 18px;
      font-weight: bold;
    }

    .featured-product-card .card-text {
      color: #777;
    }
</style>
</head>
<body>
<jsp:include page="layout/header.jsp" ></jsp:include>
<div id="carouselExampleIndicators" class="carousel slide">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://shopdunk.com/images/uploaded/banner/Banner%20Th%C3%A1ng%2005%202023/PC.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="https://shopdunk.com/images/uploaded/banner/banner%20iphone%2014%20Pro%20Max%20PCuuu.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="https://shopdunk.com/images/uploaded/banner/Banner%20Th%C3%A1ng%2005%202023/banner%20mac2-19.jpeg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="https://shopdunk.com/images/uploaded/banner/Banner%20Th%C3%A1ng%2005%202023/banner%20apple%20watch%20t5_Banner%20PC2.jpeg" class="d-block w-100" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <!-- Featured Products -->
  <section class="py-5">
    <div class="container">
      <h2 class="text-center mb-4">Featured Products</h2>
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card featured-product-card">
            <img src="https://shopdunk.com/images/thumbs/0008734_iphone-14-pro-128gb_240.png" class="card-img-top" alt="Product 1">
            <div class="card-body">
              <h5 class="card-title">Iphone 14 Pro</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
              <a href="#" class="btn btn-primary">Buy Now</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card featured-product-card">
            <img src="https://shopdunk.com/images/thumbs/0009181_iphone-14-128gb_240.png" class="card-img-top" alt="Product 2">
            <div class="card-body">
              <h5 class="card-title">Iphone 14</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
              <a href="#" class="btn btn-primary">Buy Now</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card featured-product-card">
            <img src="https://shopdunk.com/images/thumbs/0007808_iphone-14-pro-max-128gb_240.png" class="card-img-top" alt="Product 3">
            <div class="card-body">
              <h5 class="card-title">Iphone 14 Promax</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
              <a href="#" class="btn btn-primary">Buy Now</a>
            </div>
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
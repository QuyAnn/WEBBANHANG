<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="../static/css/index.css">
<link rel="stylesheet" href="../static/css/cart.css"></head>
<body>
<jsp:include page="layout/header.jsp" ></jsp:include>
<main class="page">
        <section class="shopping-cart dark">
            <div class="container">
                <div class="block-heading">
                    <h2>Giỏ hàng</h2>
                    <p>Chào mừng đến với giỏ hàng của bạn, bạn có thể mua sắm và thanh toán</p>
                </div>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="items">

                                <div class="product">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <img class="img-fluid mx-auto d-block image" src="https://shopdunk.com/images/thumbs/0008734_iphone-14-pro-128gb_240.png">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="info">
                                                <div class="row">
                                                    <div class="col-md-4 product-name">
                                                        <div class="product-name">
                                                            <a href="#">Sản phẩm 1</a>
                                                            <div class="product-info">
                                                                <div>Display: <span class="value">5 inch</span></div>
                                                                <div>RAM: <span class="value">4GB</span></div>
                                                                <div>Memory: <span class="value">32GB</span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 quantity">
                                                        <label for="quantity">Số lượng:</label>
                                                        <input id="quantity" type="number" value="1" class="form-control quantity-input">
                                                    </div>
                                                    <div class="col-md-2 price">
                                                        <span>$120</span>
                                                    </div>
                                                    <div class="col-md-3 price">
                                                        <button class="btn btn-sm btn-danger remove-product">Xoá khỏi giỏ hàng</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="summary">
                                <h3>Thanh toán</h3>
                                <div class="summary-item"><span class="text">Số lượng:</span><span class="price">12</span></div>
                                <div class="summary-item"><span class="text">Tổng tiền:</span><span class="price">$360</span></div>
                                <button type="button" class="btn btn-danger btn-lg btn-block">Cập nhật giỏ hàng</button>
                                <button type="button" class="btn btn-primary btn-lg btn-block">Thanh toán</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
<jsp:include page="layout/footer.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
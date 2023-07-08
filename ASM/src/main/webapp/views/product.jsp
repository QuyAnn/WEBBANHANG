
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản phẩm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/index.css">
<link rel="stylesheet" href="../static/css/index.css">
</head>
<body>
<jsp:include page="layout/header.jsp" ></jsp:include>

<div class="container" >
  <div class="row">
  <div class="col-lg-2" id="fillcate">
  <h5>Loại sản phẩm</h5>
    <c:forEach items="${categories}" var="cate">
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/category/${cate.id}/product/list" class="list-group-item">${cate.name}</a>
			</div>
	</c:forEach>
	
      <div class="price-filter">
        <h5>Price Range</h5>
        <form id="priceFilterForm" action="${pageContext.request.contextPath}/product/list" method="GET">
          <div class="form-group">
            <label for="minPrice">Min Price:</label>
            <input type="number" class="form-control" id="minPrice" name="minPrice">
            
          </div>
          <div class="form-group">
            <label for="maxPrice">Max Price:</label>
            <input type="number" class="form-control" id="maxPrice" name="maxPrice">
          </div>
          <button type="submit" class="btn btn-primary">Filter</button>
        </form>
      </div>
    </div>
    <div class="col-lg-10">
      <!-- Sản phẩm -->
      <div class="row">
      <c:if test="${empty product}">
      <p class="messproduct">Không tìm thấy sản phẩm nào</p>
      </c:if>
      
      
      
      <c:if test="${not empty product}">
      <c:forEach var="item" items="${product}">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="product-card">
              <img src="/static/${item.image}" alt="Product" class="product-image">
              <div class="product-details">
                <h4 class="product-name">${item.name}</h4>
                <p class="product-price">Gía: ${item.price}$</p>
                <button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
              </div>
              <div class="overlay">
                <a href="${pageContext.request.contextPath}/product/${item.id}" class="detail">Chi tiết</a>
              </div>
            </div>
          </div>
        </c:forEach>
        </c:if>
      </div>
      <div class="pager">
        <ul class="pagination">
          <c:forEach begin="1" end="${totalPage}" varStatus="status">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product/list?pageNum=${status.index}">${status.index}</a></li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>







<%-- <div class="container">
              <div class="row">
              <c:forEach var="item" items="${product}">
                <div class="col-lg-4 col-md-6 mb-4">
                  <div class="product-card">
                    <img src="/static/${item.image}" alt="Product" class="product-image">
                    <div class="product-details">
                      <h4 class="product-name">${item.name}</h4>
                      <p class="product-price">Price:${item.price}$</p>
                      <button class="add-to-cart-btn">Add to Cart</button>
                    </div>
                    <div class="overlay">  
                      <a href="${pageContext.request.contextPath}/product/${item.id}" class="detail">Detail</a>
                    </div>
                  </div>
                </div> 
                </c:forEach>
              </div>
              <div class="pager">
                <ul class="pagination">
		<c:forEach begin="1" end="${totalPage}" varStatus="status" >
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product/list?pageNum=${status.index}">${status.index}</a></li>
			</c:forEach>
			
		</ul>
        </div>
    </div> --%>
<jsp:include page="layout/footer.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</body>
</html>

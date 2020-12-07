<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
.card-text {
	width: 550px;
	text-align: justify;
}

.title {
	width: 500px;
	text-align: center;
}

.shopping_cart {
	width: 550px;
}

.shopping_cart .cart_title {
	text-align: center;
}
</style>
</head>
<body>
	<div class="col-lg-9">
		<div class="card mt-4">
			<img src="<c:url value='/uploads/${sanpham.hinhanhsp}'/>" width="250"
				height="200" alt="">
			<div class="card-body">
				<div class="title">
					<h3 class="card-title">${sanpham.tensp}</h3>
				</div>
				<fmt:setLocale value="vi_VN" scope="session" />
				<h5 style="color: #f20;" align="center">
					<fmt:formatNumber type="currency" value="${sanpham.giamoi}" />
				</h5>
				<p class="card-text">${sanpham.motasp}</p>

				<div class="shopping_cart">
					<div class="cart_title">
						<c:choose>
							<c:when test="${sanpham.soluong <= 0}">
									<h3 style="color: #f20;">Đã hết hàng</h3>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/shop/buyProduct?id=${sanpham.masp }' />"
									class="btn btn-primary">Thêm giỏ hàng</a>
								<br />
								<span class="text-warning">&#9733; &#9733; &#9733;
									&#9733; &#9734;</span>
							</c:otherwise>
						</c:choose>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- /.card -->
</body>
</html>
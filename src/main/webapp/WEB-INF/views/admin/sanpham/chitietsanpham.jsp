<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card" style="width: 40rem;">
		<img src="<c:url value="/uploads/${sanpham.hinhanhsp}" />"
			height="200" class="card-img-top avatar" alt="Hình ảnh sản phẩm">
		<div class="card-body">
			<p class="card-text">
			<div class="row">
				<div class="col">
					<label> <spring:message code="product.name"></spring:message>
					</label>
				</div>
				<div class="col">${sanpham.tensp}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="product.price"></spring:message></label>
				</div>
				<div class="col" style="padding-top: 5px;">
					<fmt:setLocale value="vi_VN" scope="session" />
					<h6 style="color: #f20;">
						<fmt:formatNumber type="currency" value="${sanpham.giacu}" />
					</h6>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="product.description"></spring:message></label>
				</div>
				<div class="col">${sanpham.motasp}</div>
			</div>
		</div>
	</div>
</body>
</html>
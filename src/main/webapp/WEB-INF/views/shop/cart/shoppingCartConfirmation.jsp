<%@ taglib prefix="Spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.entry-header-area ptb-40 {
	padding-top: 30px;
}
</style>
</head>
<body>
	<div class="entry-header-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="entry-header">
						<h1 class="entry-title">
							<center>
								<spring:message code="cart.order"></spring:message>
							</center>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="customer-info-container" border="1">
		<div class="card" style="width: 40rem;">

			<div class="card-body">
				<p class="card-text">
					<strong><center>
							<spring:message code="home.info2"></spring:message>
						</center></strong>
				<div class="row">
					<div class="col">
						<label><spring:message code="customer.name"></spring:message></label>
					</div>
					<div class="col">${myCart.customerInfo.firstName}
						${myCart.customerInfo.lastName}</div>
				</div>
				<div class="row">
					<div class="col">
						<label><spring:message code="customer.address"></spring:message></label>

					</div>
					<div class="col">${myCart.customerInfo.street},
						${myCart.customerInfo.district} , ${myCart.customerInfo.city}</div>
				</div>

				<div class="row">
					<div class="col">
						<label><spring:message code="customer.phone"></spring:message></label>

					</div>
					<div class="col">${myCart.customerInfo.numberPhone}</div>
				</div>
				<div class="row">
					<div class="col">
						<label><spring:message code="customer.email"></spring:message></label>

					</div>
					<div class="col">${myCart.customerInfo.email}</div>
				</div>
				<strong><center>
						<spring:message code="order.summary"></spring:message>
					</center></strong>

				<div class="row">
					<div class="col">
						<label><spring:message code="product.quantity"></spring:message></label>

					</div>
					<div class="col">${myCart.quantityTotal}</div>
				</div>
				<div class="row">
					<div class="col">
						<label><spring:message code="order.subtotal"></spring:message></label>

					</div>
					<div class="col">
						<strong> <fmt:formatNumber pattern="#,##0"
								value="${myCart.amountTotal}" var="formattedAmountTotal" /> <c:out
								value="${formattedAmountTotal}"></c:out> đ
						</strong>
					</div>
				</div>

			</div>
		</div>
		<br>
		<div class="table-responsive">

			<table class="table table-striped table-sm" border="1">
				<thead>

					<tr>
						<th><spring:message code="product.image"></spring:message></th>
						<th><spring:message code="product.id"></spring:message></th>
						<th><spring:message code="product.quantity"></spring:message></th>
						<th><spring:message code="product.price"></spring:message></th>
						<th><spring:message code="order.subtotal"></spring:message></th>
					</tr>
				<tbody>

					<c:forEach items="${myCart.cartLines}" var="cartLineInfo">
						<tr>

							<td><img class="product-image" width="60" height="60"
								src="<c:url value="/uploads/${cartLineInfo.productInfo.hinhanhsp}" />" /></td>
							<td>${cartLineInfo.productInfo.tensp}</td>
							<td>${cartLineInfo.quantity}</td>
							<td><span class="price"> <fmt:formatNumber
										pattern="#,##0" value="${cartLineInfo.productInfo.giamoi}" />đ
							</span></td>
							<td><span class="subtotal"> <fmt:formatNumber
										pattern="#,##0" value="${cartLineInfo.amount}" />đ
							</span></td>

						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>

		<form method="POST"
			action="${pageContext.request.contextPath}/shop/shoppingCartConfirmation">

			<!-- Edit Cart -->

			<a class="btn btn-primary"
				href="${pageContext.request.contextPath}/shop/shoppingCart"><spring:message
					code="cart.edit"></spring:message></a>


			<!-- Edit Customer Info -->

			<a class="btn btn-secondary"
				href="${pageContext.request.contextPath}/shop/shoppingCartCustomer"><spring:message
					code="cart.editCustomer"></spring:message></a>


			<!-- Send/Save -->
			<input type="submit"
				value="<spring:message code="home.order"></spring:message>"
				class="btn btn-primary" />
		</form>
	</div>
</body>
</html>
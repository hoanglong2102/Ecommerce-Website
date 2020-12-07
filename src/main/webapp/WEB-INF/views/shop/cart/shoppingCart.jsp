<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.thongtingiohang {
	height: 300px;
	width: 800px;
	margin: 80px 0 0 90px;
	padding: 50px;
}

.thongtingiohang .shopping {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${kq}">
			<div class="entry-header-area ptb-40">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="entry-header">
								<h1 class="entry-title">
									<center>
										<spring:message code="home.cart"></spring:message>
									</center>
								</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:if
				test="${cartForm != null && cartForm.cartLines != null&& !empty cartForm.cartLines}">
				<div class="cart-main-area ptb-40">
					<div class="container">
						<div class="cart-main-area ptb-40">
							<div class="container">
								<div class="row">
									<div class="col-lg-18 col-md-18 col-sm-18 col-xs-18">
										<div class="table-content table-responsive">
											<c:if test="${not empty message }">
												<div class="alert alert-danger" role="alert">
													${message}</div>
											</c:if>

											<table id="mainCartTable"
												class="table table-bordered table-hover">
												<thead>
													<tr>
														<th><spring:message code="product.image"></spring:message></th>
														<th><spring:message code="product.id"></spring:message></th>
														<th><spring:message code="product.name"></spring:message></th>
														<th><spring:message code="product.price"></spring:message></th>
														<th><spring:message code="product.quantity"></spring:message></th>
														<th><spring:message code="order.subtotal"></spring:message></th>
														<th><spring:message code="order.status"></spring:message></th>
													</tr>
												</thead>
												<tbody>
													<c:set var="saveUrl"
														value="${pageContext.request.contextPath}/shop/shoppingCart" />
													<c:if
														test="${cartForm != null && cartForm.cartLines != null && !empty cartForm.cartLines}">
														<form:form method="POST" modelAttribute="cartForm"
															action="${saveUrl }">

															<div class="product-preview-container">
																<c:forEach items="${cartForm.cartLines}"
																	var="cartLineInfo" varStatus="status">
																	<tr>
																		<td data-th="Image">
																			<div class="row-cart">
																				<div class="col-sm-4 hidden-xs">
																					<img class="product-image" width="60" height="60"
																						src="<c:url value="/uploads/${cartLineInfo.productInfo.hinhanhsp}" />">
																				</div>
																			</div>
																		</td>
																		<td width="10%">${cartLineInfo.productInfo.masp}<form:input
																				type="hidden"
																				class="input-small quantity text-center"
																				path="cartLines[${status.index}].productInfo.masp"
																				value="${cartLineInfo.productInfo.masp}" />
																		</td>
																		<td>${cartLineInfo.productInfo.tensp}</td>
																		<td><strong><fmt:formatNumber
																					value="${cartLineInfo.productInfo.giamoi}" /> đồng</strong></td>
																		<td><form:input
																				path="cartLines[${status.index}].quantity"
																				value="${cartLineInfo.quantity}" type="number" /></td>
																		<td><fmt:formatNumber
																				value="${cartLineInfo.amount}" /> đồng</td>
																		<td><a
																			href="<c:url value='/shop/shoppingCartRemoveProduct?id=${cartLineInfo.productInfo.masp}' />">
																				<i class="fas fa-trash"></i>
																		</a></td>
																</c:forEach>

															</div>
															<div class="updateQuantity buttons-cart">
																<input class="btn btn-primary" type="submit"
																	value='<spring:message code="cart.quantity"></spring:message>' />
															</div>

														</form:form>
													</c:if>
												</tbody>
											</table>
										</div>

										<div class="row">
											<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
												<div class="buttons-cart">
													<a class="btn btn-primary"
														href="${pageContext.request.contextPath}/"><spring:message
															code="cart.continue"></spring:message></a> <a
														href="<c:url value='/shop/shoppingCartCustomer' />"
														class="btn btn-primary"><spring:message
															code="cart.proceed"></spring:message></a>
												</div>
											</div>
											<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
												<div class="cart_totals">
													<h2>
														<spring:message code="order.subtotal"></spring:message>
													</h2>
													<div class="cart-totals-table">
														<table>
															<tr class="cart-subtotal">
																<th><spring:message code="product.quantity"></spring:message></th>
																<td><span class="amount">${myCart.quantityTotal}</span></td>
															</tr>

															<tr class="cart-subtotal">
																<th><spring:message code="order.subtotal"></spring:message></th>
																<td><span class="amount"><fmt:formatNumber
																			value="${myCart.amountTotal}" /> đồng</span></td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:when>
		<c:otherwise>
			<div class="thongtingiohang">
				<div class="shopping">
					<h3>${message}</h3>
					<div class="buttons-cart">
						<a class="btn btn-primary"
							href="${pageContext.request.contextPath}/"><spring:message
								code="cart.return"></spring:message></a>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
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

		<div class="card-body">
			<p class="card-text">
			<h2>
				<center>
					<spring:message code="order.info"></spring:message>
				</center>
			</h2>
			<div class="row">
				<div class="col">
					<label><spring:message code="order.name"></spring:message></label>

				</div>
				<div class="col">${order.customer.firstName}
					${order.customer.lastName}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="order.address"></spring:message></label>
				</div>
				<div class="col">${order.customer.street},${order.customer.district},${order.customer.city}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="order.phoneNumber"></spring:message></label>
				</div>

				<div class="col">${order.customer.numberPhone}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="order.email"></spring:message></label>
				</div>
				<div class="col">${order.customer.email}</div>
			</div>
			<h2>
				<center>
					<spring:message code="order.summary"></spring:message>
				</center>
			</h2>
			<div class="row">
				<div class="col">
					<label><spring:message code="order.date"></spring:message></label>

				</div>
				<div class="col">${order.orderDate}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="order.status"></spring:message></label>
				</div>
				<div class="col">
					<c:if test="${order.status == 0}">
						<p>
							<c:out value="Đang chờ xử lý" />
						<p>
					</c:if>
					<c:if test="${order.status == 1}">
						<p>
							<c:out value="Đã được xử lý" />
						<p>
					</c:if>
					<c:if test="${order.status == 2}">
						<p>
							<c:out value="Đã xử lý" />
						<p>
					</c:if>
					<c:if test="${o.status == 3}">
						<p>
							<c:out value="Đã hủy đơn" />
						<p>
					</c:if>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<label> <spring:message code="order.subtotal"></spring:message>
					</label>

				</div>
				<div class="col">
					<fmt:formatNumber value="${order.amount}" />
				</div>
			</div>


		</div>
		<div class="table-responsive">

			<table class="table table-striped table-sm">
				<thead>

					<tr>

						<th><spring:message code="product.id"></spring:message></th>
						<th><spring:message code="product.image"></spring:message></th>
						<th><spring:message code="product.name"></spring:message></th>
						<th><spring:message code="product.quantity"></spring:message></th>
						<th><spring:message code="product.price"></spring:message></th>
						<th><spring:message code="order.subtotal"></spring:message></th>

					</tr>
				<tbody>

					<c:forEach items="${orderDetailList}" var="orderDetail">
						<tr style="font-size: 15px;">

							<td>${orderDetail.sanpham.masp}</td>
							<td style="text-align: center"><img
								src="<c:url value="/uploads/${orderDetail.sanpham.hinhanhsp}" />"
								height="60" width="60"></td>
							<td>${orderDetail.sanpham.tensp}</td>
							<td>${orderDetail.quantity}</td>
							<fmt:setLocale value="vi_VN" scope="session" />
							<td><fmt:formatNumber value="${orderDetail.price}" /></td>
							<td><fmt:formatNumber value="${orderDetail.amount}" /></td>

						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>
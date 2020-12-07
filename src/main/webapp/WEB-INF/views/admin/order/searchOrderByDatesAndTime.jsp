<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript" src="/resources/js/order.js"></script>
<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Order</title>


<script>
	$(document).ready(function() {
		$("input[value='hien']").click(function() {
			$("#div1").show();
			$("#div2").hide();
		})
		$("input[value='an']").click(function() {
			$("#div1").hide();
			$("#div2").show();
		})
	})
</script>
<script>
	$(document).ready(function() {
		$('#div2').hide();
	})
</script>
</head>


<body>
	<center>
		<p>
			Kết quả tìm kiếm cho ngày <strong>${Date} |
				${Hour}:${Minute} </strong> - có ${size} kết quả tìm kiếm được
		</p>
	</center>

	<div class="table-responsive">

		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th><spring:message code="order.id"></spring:message></th>
					<th><spring:message code="order.date"></spring:message></th>
					<th><spring:message code="order.name"></spring:message></th>
					<th><spring:message code="order.address"></spring:message></th>
					<th><spring:message code="order.email"></spring:message></th>
					<th><spring:message code="order.phoneNumber"></spring:message></th>
					<th><spring:message code="order.subtotal"></spring:message></th>
					<th><spring:message code="order.status"></spring:message></th>
					<th><spring:message code="order.update"></spring:message></th>
					<th><spring:message code="order.delete"></spring:message></th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${orders}" var="o">
					<tr>
						<td><a
							href="<c:url value='/admin/order/viewsOrderDetail/${o.id}?mode=VIEW' />">${o.id}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${o.orderDate}" /></td>
						<td>${o.customer.firstName}${o.customer.lastName}</td>
						<td>${o.customer.street },${o.customer.district },
							${o.customer.city}</td>
						<td>${o.customer.email }</td>
						<td>${o.customer.numberPhone}</td>
						<fmt:setLocale value="vi_VN" scope="session" />
						<td><fmt:formatNumber value="${o.amount}" /></td>
						<td><c:if test="${o.status == 0}">
								<p>
									<c:out value="Đang chờ xử lý" />
								<p>
							</c:if> <c:if test="${o.status == 1}">
								<p>
									<c:out value="Đang xử lý" />
								<p>
							</c:if> <c:if test="${o.status == 2}">
								<p>
									<c:out value="Đã xử lý" />
								<p>
							</c:if> <c:if test="${o.status == 3}">
								<p>
									<c:out value="Đã hủy đơn" />
								<p>
							</c:if></td>
						<sec:authorize access="hasAnyRole('SUPER_ADMIN','MANAGER')">
							<td><a
								href="<c:url value='/admin/order/orderdetailupdate/${o.id}?mode=EDIT' />"><i
									class="fas fa-edit"></i></a></td>
							<td><a
								href="<c:url value='/admin/order/deleteOrder/${o.id}' />"><i
									class="fas fa-trash"></i></a></td>
						</sec:authorize>


					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<br />
</body>
</html>
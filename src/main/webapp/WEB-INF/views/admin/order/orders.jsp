<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript" src="/resources/js/order.js"></script>
<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tất cả hóa đơn</title>

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
	<h2>
		<center>
			<spring:message code="menu.order"></spring:message>
		</center>
	</h2>
	<p>
		<input type="radio" name="abc" value="hien" checked>
		<spring:message code="order.titleSearch"></spring:message>
	</p>
	<p>
		<input type="radio" name="abc" value="an">
		<spring:message code="order.titleSearch2"></spring:message>
	</p>
	<div class="container">
		<!-- 		<div class="col-sm-1"></div> -->
		<form method="POST" action="searchByFromDateAndToDate">
			<div class="form-group row" id="div1">
				<label for="fromDate" class="col-xs-2 col-form-label"><b><i><spring:message
								code="order.search"></spring:message></i></b></label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="fromDate"
						id="fromDate" placeholder="fromDate">
				</div>

				<label for="toDate" class="col-xs-2 col-form-label"> <b><i><spring:message
								code="order.search2"></spring:message></i></b>
				</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="toDate" id="toDate"
						placeholder="toDate">
				</div>
				<label for="inputPassword" class="col-xs-2 col-form-label"></label>
				<div class="col-sm-2">
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i>
						<spring:message code="search.admin"></spring:message>
					</button>
				</div>
			</div>
		</form>
	</div>
	<div class="container">
		<!-- 	<div class="col-sm-1"></div> -->
		<form method="POST" action="searchOrderByDatesAndTime">
			<div class="form-group row" id="div2">
				<label for="Hour" class="col-xs-1 col-form-label"><b><i>Ngày</i></b></label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="Date" id="Date"
						placeholder="Date">
				</div>

				<label for="Hour" class="col-xs-1 col-form-label"><b><i>Giờ</i></b></label>
				<div class="col-sm-1">
					<input type="number" class="form-control" name="Hour" min="0"
						max="24" id="Hour">
				</div>
				<label for="Minute" class="col-xs-1 col-form-label"><b><i>Phút</i></b></label>
				<div class="col-sm-1">
					<input type="number" class="form-control" name="Minute" min="0"
						max="59" id="Minute">
				</div>

				<div class="col-sm-2">
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i>
						<spring:message code="search.admin"></spring:message>
					</button>
				</div>
			</div>
		</form>


	</div>

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
				<c:forEach items="${orders.getContent()}" var="o">
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
									<c:out value="Đang được xử lý" />
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
		<c:set var="orderPage">
			<spring:message code="order.page" />
		</c:set>
		<c:if test="${orders.totalPages > 0}">
			<util:pagination thispage="${orders}" recordPageTitle="${orderPage}"
				currentPage="${currentPage}"></util:pagination>
		</c:if>
	</div>

	<br />
</body>
</html>
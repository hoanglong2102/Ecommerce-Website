<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Update Order</title>

</head>


<body>

	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
			Thêm Hóa đơn
		</c:if>
			<c:if test="${mode == 'EDIT'}">
				<center>
					<spring:message code="order.update"></spring:message>
				</center>
			</c:if>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/order/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="order">
				<form:input type="hidden" path="id" id="id" />
				<form:input type="hidden" path="customer" id="customeId" />
				<form:input path="amount" type="hidden" id="amount" />
				<form:input path="orderDate" type="hidden" id="orderDate" />

				<div class="form-group">
					<div>
						<label><spring:message code="order.status"></spring:message></label>
					</div>
					<form:select path="status">
						<option selected value="0">Đang chờ xử lý</option>
						<option selected value="1">Đang xử lý</option>
						<option selected value="2">Đã xử lý</option>
						<option selected value="3">Đã hủy đơn</option>
					</form:select>
				</div>
				<button type="submit" class="btn btn-primary" value="Save">
					<spring:message code="order.update"></spring:message>
				</button>
			</form:form>
		</div>
	</div>
</body>
</html>
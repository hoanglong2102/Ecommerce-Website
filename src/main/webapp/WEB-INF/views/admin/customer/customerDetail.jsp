<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cập nhật thông tin khách hàng</title>

</head>


<body>

	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<center>
				<spring:message code="customer.edit"></spring:message>
			</center>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/customer/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="customer">
				<form:input type="hidden" path="id" id="id" />
				<%-- <form:input type="hidden" path="address.id" id="addressId"/> --%>
				<%-- <form:input type="hidden" path="userName" id="userName" />
				<form:input type="hidden" path="password" id="password" />
				<form:input type="hidden" path="isActive" id="isActive" /> --%>
				<div class="form-group">
					<label for="firstName"><spring:message
							code="customer.firstname"></spring:message></label>
					<form:input path="firstName" type="text" class="form-control"
						id="firstName" />
				</div>
				<div class="form-group">
					<label for="lastName"><spring:message
							code="customer.lastname"></spring:message></label>
					<form:input path="lastName" type="text" class="form-control"
						id="lastName" />
				</div>
				<div class="form-group">
					<label for="email"><spring:message code="customer.email"></spring:message>
					</label>
					<form:input path="email" type="text" class="form-control"
						id="email" />
				</div>

				<div class="form-group">
					<label for="city"><spring:message code="customer.city"></spring:message></label>
					<form:input path="city" type="text" class="form-control" id="city" />
				</div>

				<div class="form-group">
					<label for="district"><spring:message
							code="customer.district"></spring:message></label>
					<form:input path="district" type="text" class="form-control"
						id="district" />
				</div>
				<div class="form-group">
					<label for="street"><spring:message code="customer.street"></spring:message></label>
					<form:input path="street" type="text" class="form-control"
						id="street" />
				</div>


				<div class="form-group">
					<label for="numberPhone"><spring:message
							code="customer.phone"></spring:message></label>
					<form:input path="numberPhone" type="text" class="form-control"
						id="numberPhone" />
				</div>
				<%-- <div class="form-group">
					<label for="profileImageFile">Image: </label> <img
						src="<c:url value="/uploads/${user.profileImage}" />" height="200"
						width="200" />
					<form:input path="profileImageFile" class="form-control"
					id="profileImageFile" name="profileImageFile" type="file" /> 
				</div> --%>
				<button type="submit" class="btn btn-primary">
					<spring:message code="customer.update"></spring:message>
				</button>
			</form:form>
		</div>
	</div>
</body>
</html>
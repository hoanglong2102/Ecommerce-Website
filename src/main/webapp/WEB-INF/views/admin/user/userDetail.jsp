<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Info</title>


</head>


<body>

	<div class="card" style="width: 40rem;">
		<img src="<c:url value="/uploads/${user.profileImage}" />"
			height="200" class="card-img-top avatar" alt="Avatar">
		<div class="card-body">
			<h5 class="card-title">
				<center>${user.firstName}${user.lastName}</center>
			</h5>
			<p class="card-text">
			<div class="row">
				<div class="col">
					<label><spring:message code="user.email"></spring:message></label>

				</div>
				<div class="col">${user.email}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="user.phone"></spring:message></label>
				</div>
				<div class="col">${user.phoneNumber}</div>
			</div>
		</div>
	</div>

</body>
</html>
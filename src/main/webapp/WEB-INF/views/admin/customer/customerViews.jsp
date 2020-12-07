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
<h2>
	<center>
		<spring:message code="customer.edit"></spring:message>
	</center>
</h2>
<body>
	<div class="card" style="width: 40rem;">

		<div class="card-body">
			<p class="card-text">
			<div class="row">
				<div class="col">
					<label> <spring:message code="customer.name"></spring:message>
					</label>

				</div>
				<div class="col">${customers.firstName}${customers.lastName}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="customer.address"></spring:message></label>
				</div>
				<div class="col">${customers.street},${customers.district},${customers.city}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="customer.email"></spring:message></label>
				</div>
				<div class="col">${customers.email}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><spring:message code="customer.phone"></spring:message></label>
				</div>
				<div class="col">${customers.numberPhone}</div>
			</div>


		</div>
	</div>
</body>
</html>
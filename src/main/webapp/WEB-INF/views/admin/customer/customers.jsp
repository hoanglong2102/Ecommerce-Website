<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Customer</title>

</head>


<body>
	<h2>
		<center>
			<spring:message code="menu.customer"></spring:message>
		</center>
	</h2>

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/customer/timkiemcustomer" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="<spring:message code="customer.input"></spring:message>"
						aria-label="Search">
				</div>
				<div class="col-sm">

					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search"></i>&nbsp;
						<spring:message code="search.admin"></spring:message>
					</button>
				</div>
			</div>
		</form:form>
	</div>
	<div class="table-responsive">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/customer/customerViews" />
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th><spring:message code="customer.id"></spring:message></th>
					<th><spring:message code="customer.name"></spring:message></th>
					<th><spring:message code="customer.address"></spring:message></th>
					<th><spring:message code="customer.email"></spring:message></th>
					<th><spring:message code="customer.phone"></spring:message></th>
					<th><spring:message code="customer.update"></spring:message></th>
					<th><spring:message code="customer.delete"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customers.getContent()}" var="c">
					<tr>
						<td><a
							href="<c:url value='/admin/customer/viewsCustomer/${c.id}?mode=VIEW' />">${c.id}</a></td>
						<td>${c.firstName}${c.lastName}</td>
						<td>${c.street},${c.district},${c.city}</td>
						<td>${c.email}</td>
						<td>${c.numberPhone}</td>
						<sec:authorize access="hasAnyRole('SUPER_ADMIN', 'MANAGER')">
							<td><a
								href="<c:url value='/admin/customer/getCustomer/${c.id}?mode=EDIT' />"><i
									class="fas fa-edit"></i></a></td>
							<td><a
								href="<c:url value='/admin/customer/deleteCustomer/${c.id}' />"><i
									class="fas fa-trash"></i></a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<c:set var="customerPage">
			<spring:message code="customer.page" />
		</c:set>
		<c:if test="${customers.totalPages > 0}">
			<util:pagination thispage="${customers}"
				recordPageTitle="${customerPage}"
				currentPage="${currentPage}"></util:pagination>
		</c:if>
	</div>

	<br />
</body>
</html>
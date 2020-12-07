<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<center>
			<spring:message code="menu.customer"></spring:message>
		</center>
	</h2>

	<c:choose>
		<c:when test="${ketqua}">
			<div class="table-responsive">
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
						<c:forEach items="${customers}" var="c">
							<tr>
								<td><a
									href="<c:url value='/admin/customer/viewsCustomer/${c.id}?mode=VIEW' />">${c.id}</a></td>
								<td>${c.firstName}${c.lastName}</td>
								<td>${c.street},${c.district},${c.city}</td>
								<td>${c.email}</td>
								<td>${c.numberPhone }</td>
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
			</div>
		</c:when>
		<c:otherwise>
			<h4>
				<spring:message code="customer.error"></spring:message>
			</h4>
		</c:otherwise>
	</c:choose>

</body>
</html>
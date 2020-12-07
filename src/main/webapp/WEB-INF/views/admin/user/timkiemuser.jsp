<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Users</title>

</head>


<body>
	<h2>
		<center>
			<spring:message code="menu.user"></spring:message>
		</center>
	</h2>
	<div class="table-responsive">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th><spring:message code="user.id"></spring:message></th>
					<th><spring:message code="user.username"></spring:message></th>
					<th><spring:message code="user.name"></spring:message></th>
					<th><spring:message code="user.email"></spring:message></th>
					<th><spring:message code="user.phone"></spring:message></th>
					<th><spring:message code="user.update"></spring:message></th>
					<th><spring:message code="user.delete"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td><a
							href="<c:url value='/admin/user/getUser/${user.id}?mode=VIEW' />">${user.id}</a></td>
						<td>${user.userName}</td>
						<td>${user.firstName}${user.lastName}</td>
						<td>${user.email}</td>
						<td>${user.phoneNumber}</td>
						<sec:authorize access="hasAnyRole('SUPER_ADMIN','MANAGER')">
							<td><a
								href="<c:url value='/admin/user/getUser/${user.id}?mode=EDIT' />"><i
									class="fas fa-edit"></i></a></td>
							<td><a
								href="<c:url value='/admin/user/deleteUser/${user.id}' />"><i
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
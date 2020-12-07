<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
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

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/user/timkiemuser" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="<spring:message code="user.search"></spring:message>"
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
				<c:forEach items="${users.getContent()}" var="user">
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
		<c:set var="userPage">
			<spring:message code="user.page" />
		</c:set>
		<c:if test="${users.totalPages > 0}">
			<util:pagination thispage="${users}" recordPageTitle="${userPage}"
				currentPage="${currentPage}"></util:pagination>
		</c:if>
	</div>

	<br />
	<a href="<c:url value='/admin/user/addUser' />"><i
		class="far fa-plus-square"></i>&nbsp; <spring:message code="user.add"></spring:message></a>
</body>
</html>
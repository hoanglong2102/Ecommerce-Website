<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<center>
			<spring:message code="menu.manufacturer"></spring:message>
		</center>
	</h2>

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/quanlynhasanxuat/timkiemnhasanxuat" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="<spring:message code="manufacturer.input"></spring:message>"
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
					<th><spring:message code="manufacturer.id"></spring:message></th>
					<th><spring:message code="manufacturer.name"></spring:message></th>
					<th><spring:message code="manufacturer.update"></spring:message></th>
					<th><spring:message code="manufacturer.delete"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${manufacturer.getContent()}" var="m">
					<tr>
						<td><a
							href="<c:url value='/admin/quanlynhasanxuat/${m.maNSX}?mode=VIEW' />">${m.maNSX}</a></td>
						<td>${m.tenNSX}</td>
						<td><a
							href="<c:url value='/admin/quanlynhasanxuat/${m.maNSX}?mode=EDIT' />"><i
								class="fas fa-edit"></i></a></td>
						<td><a
							href="<c:url value='/admin/quanlynhasanxuat/xoanhasanxuat/${m.maNSX}' />"><i
								class="fas fa-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<c:set var="manufacturerPage">
			<spring:message code="manufacturer.page" />
		</c:set>
		<c:if test="${manufacturer.totalPages > 0}">
			<util:pagination thispage="${manufacturer}"
				recordPageTitle="${manufacturerPage}" currentPage="${currentPage}"></util:pagination>
		</c:if>
	</div>
	<br />
	<a href="<c:url value='/admin/quanlynhasanxuat/themnhasanxuat' />"><i
		class="far fa-plus-square"></i>&nbsp; <spring:message
			code="manufacturer.add"></spring:message></a>
</body>
</html>
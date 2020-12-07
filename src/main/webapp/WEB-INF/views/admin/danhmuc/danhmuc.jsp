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
			<spring:message code="menu.category"></spring:message>
		</center>
	</h2>

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/quanlydanhmuc/timkiemdanhmuc" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="<spring:message code="category.input"></spring:message>"
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
					<th><spring:message code="category.id"></spring:message></th>
					<th><spring:message code="category.name"></spring:message></th>
					<th><spring:message code="category.icon"></spring:message></th>
					<th><spring:message code="category.update"></spring:message></th>
					<th><spring:message code="category.delete"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${danhmuc.getContent()}" var="danhmuc">
					<tr>
						<td><a
							href="<c:url value='/admin/quanlydanhmuc/${danhmuc.madm}?mode=VIEW' />">${danhmuc.madm}</a></td>
						<td>${danhmuc.tendm}</td>
						<td>${danhmuc.hinhanhdm}</td>
						<td><a
							href="<c:url value='/admin/quanlydanhmuc/${danhmuc.madm}?mode=EDIT' />"><i
								class="fas fa-edit"></i></a></td>
						<td><a
							href="<c:url value='/admin/quanlydanhmuc/xoadanhmuc/${danhmuc.madm}' />"><i
								class="fas fa-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<c:set var="categoryPage">
			<spring:message code="category.page" />
		</c:set>
		<c:if test="${danhmuc.totalPages > 0}">
			<util:pagination thispage="${danhmuc}"
				recordPageTitle="${categoryPage}" currentPage="${currentPage}"></util:pagination>
		</c:if>
	</div>
	<br />
	<a href="<c:url value='/admin/quanlydanhmuc/themdanhmuc' />"><i
		class="far fa-plus-square"></i>&nbsp; <spring:message
			code="category.add"></spring:message></a>
</body>
</html>
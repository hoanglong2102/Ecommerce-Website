<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<spring:message code="menu.product"></spring:message>
		</center>
	</h2>
    <div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/quanlysanpham/timkiemsanpham" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder='<spring:message code="product.search"></spring:message>'
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
	<c:choose>
		<c:when test="${ketqua}">
			<h1 style="font-size: 18px;">${message}</h1>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th><spring:message code="product.id"></spring:message></th>
							<th><spring:message code="product.name"></spring:message></th>
							<th><spring:message code="product.price"></spring:message></th>
							<th><spring:message code="product.discount"></spring:message></th>
							<th><spring:message code="product.quantity"></spring:message></th>
							<th><spring:message code="product.description"></spring:message></th>
							<th><spring:message code="product.update"></spring:message></th>
							<th><spring:message code="product.delete"></spring:message></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sanpham.getContent()}" var="sanpham">
							<tr style="font-size: 15px;">
								<td><a
									href="<c:url value='/admin/quanlysanpham/${sanpham.masp}?mode=VIEW' />">${sanpham.masp}</a></td>
								<td>${sanpham.tensp}</td>
								<td>${sanpham.giacu}</td>
								<td><c:set var="giamgia" value="${sanpham.giamgia}" /> <fmt:formatNumber
										type="percent" pattern="###,###,##%" value="${giamgia}" /></td>
								<td>${sanpham.soluong}</td>
								<td>${sanpham.motasp}</td>
								<td><a
									href="<c:url value='/admin/quanlysanpham/${sanpham.masp}?mode=EDIT' />"><i
										class="fas fa-edit"></i></a></td>
								<td><a
									href="<c:url value='/admin/quanlysanpham/xoasanpham/${sanpham.masp}' />"><i
										class="fas fa-trash"></i></a></td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
			</div>
			<c:set var="productPage">
				<spring:message code="product.page" />
			</c:set>
			<c:if test="${sanpham.totalPages > 0}">
				<util:pagination thispage="${sanpham}"
					recordPageTitle="${productPage}" currentPage="${currentPage}"></util:pagination>
			</c:if>
		</c:when>
		<c:otherwise>
			<h4>
				<spring:message code="product.error"></spring:message>
			</h4>
		</c:otherwise>
	</c:choose>
</body>
</html>
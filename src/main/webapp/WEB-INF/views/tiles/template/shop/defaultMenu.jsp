<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-lg-3">

	<h4 class="my-4">
		<i class="fas fa-bars"></i>
		<spring:message code="menu.shopCategory"></spring:message>
	</h4>
	<div class="list-group">
		<c:forEach items="${danhmuc}" var="danhmuc">
			<a href="<c:url value='/listAllProductByCategory/${danhmuc.madm}' />"
				class="list-group-item">${danhmuc.hinhanhdm}&nbsp;
				${danhmuc.tendm}</a>
		</c:forEach>
	</div>

	<h4 class="my-4">
		<i class="fas fa-bars"></i>
		<spring:message code="menu.shopManufacturer"></spring:message>
	</h4>
	<div class="list-group">
		<c:forEach items="${manufacturer}" var="manufacturer">
			<a
				href="<c:url value='/listAllProductByManufacturers/${manufacturer.maNSX}' />"
				class="list-group-item"> ${manufacturer.tenNSX}</a>
		</c:forEach>
	</div>

</div>

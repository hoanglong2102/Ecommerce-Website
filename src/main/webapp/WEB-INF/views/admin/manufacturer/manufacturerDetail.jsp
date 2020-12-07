<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<spring:message code="manufacturer.infor"></spring:message>
		</center>
	</h2>
	<div class="card" style="width: 40rem;">
		<div class="card-body">
			<p class="card-text">
			<div class="row">
				<div class="col">
					<label><spring:message code="manufacturer.name"></spring:message>
					</label>
				</div>
				<div class="col">${manufacturer.tenNSX}</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<a href="<c:url value='/admin/quanlynhasanxuat/' />"><spring:message
			code="return.admin"></spring:message></a>

</body>
</html>
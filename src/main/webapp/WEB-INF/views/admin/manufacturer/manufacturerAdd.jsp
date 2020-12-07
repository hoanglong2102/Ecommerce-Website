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
<style type="text/css">
.input {
	margin-left: 25px;
}
</style>
</head>
<body>
	<div class="card" style="width: 40rem;">
		<h2>
			<center>
				<spring:message code="category.add"></spring:message>
			</center>
		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/quanlynhasanxuat/capnhatnhasanxuat" />
			<form:form method="POST" action="${saveUrl}"
				modelAttribute="manufacturer">
				<form:input type="hidden" path="maNSX" id="maNSX" />
				<div class="form-group">
					<label for="tendm"><spring:message code="manufacturer.name"></spring:message>
					</label>
					<form:input path="tenNSX" class="input" id="tenNSX" />
					<form:errors path="tenNSX" cssClass="error" />
				</div>
				<button type="submit" class="btn btn-primary">
					<spring:message code="category.update"></spring:message>
				</button>
			</form:form>
		</div>
	</div>
</body>
</html>
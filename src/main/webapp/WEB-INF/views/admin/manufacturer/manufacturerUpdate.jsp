<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div class="card" style="width: 40rem;">
	<div class="container">
		<h2 class="my-2">
			<center>
				<spring:message code="manufacturer.edit"></spring:message>
			</center>
		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/quanlynhasanxuat/capnhatnhasanxuat" />
			<form:form method="POST" action="${saveUrl}"
				modelAttribute="manufacturer">
				<form:input type="hidden" path="maNSX" id="maNSX" />
				<div class="form-group">
					<label for="tenNSX"><spring:message
							code="manufacturer.name"></spring:message></label>
					<form:input path="tenNSX" id="tenNSX" class="input" />
					<form:errors path="tenNSX" cssClass="error" />
					<c:if test="${manufacturer.tenNSX.isEmpty()}">
						<div class="alert alert-danger" role="alert">
							<h4><spring:message code="manufacturer.alert"></spring:message></h4>
						</div>
					</c:if>
				</div>
				<button type="submit" class="btn btn-primary">
					<spring:message code="manufacturer.update"></spring:message>
				</button>
			</form:form>
		</div>
	</div>
</div>
</html>
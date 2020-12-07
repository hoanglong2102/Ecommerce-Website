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
				<spring:message code="category.edit"></spring:message>
			</center>
		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/quanlydanhmuc/capnhatdanhmuc" />
			<form:form method="POST" action="${saveUrl}" modelAttribute="danhmuc">
				<form:input type="hidden" path="madm" id="madm" />
				<div class="form-group">
					<label for="tendm"><spring:message code="category.name"></spring:message></label>
					<form:input path="tendm"  oninvalid = "this.setCustomValidity('Tên danh mục không được rỗng!')"  oninput="setCustomValidity('')" required="true"  id="tendm" class="form-control" />
					<form:errors path="tendm" cssClass="error" />
				</div>
				<div class="form-group">
					<label for="hinhanhdm"><spring:message code="category.icon"></spring:message></label>
					<form:input path="hinhanhdm" type="text" name="hinhanhdm"
						class="form-control" id="hinhanhdm" />
				</div>

				<button type="submit" class="btn btn-primary">
					<spring:message code="category.update"></spring:message>
				</button>
			</form:form>
		</div>
	</div>
</div>
</html>
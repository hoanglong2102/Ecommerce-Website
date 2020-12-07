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
.inputpassword {
	margin-left: 50px;
}
</style>
</head>
<body>
	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<center>
				<spring:message code="changepassword.title"></spring:message>
			</center>
		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/changepassword/updatepassword/${username}" />
			<form:form method="POST" action="${saveUrl}">
				<div class="form-group">
					<label for="oldpassword" style="margin-left: 60px;"><spring:message
							code="changepassword.old"></spring:message></label> <input
						type="password" name="oldpassword" class="inputpassword"
						id="oldpassword" />
				</div>
				<div class="form-group">
					<label for="newpassword"><spring:message
							code="changepassword.change1"></spring:message></label> <input
						type="password" name="newpassword" class="inputpassword"
						id="newpassword" />
				</div>
				<div class="form-group">
					<label for="enterpassword"><spring:message
							code="changepassword.change2"></spring:message></label> <input
						type="password" name="enterpassword" class="inputpassword"
						id="enterpassword">
				</div>
				<c:if test="${kq == false}">
					<div class="alert alert-danger" role="alert">${message}</div>
				</c:if>
				<button type="submit" class="btn btn-primary">
					<spring:message code="user.update"></spring:message>
				</button>
			</form:form>
		</div>
	</div>
</body>
</html>
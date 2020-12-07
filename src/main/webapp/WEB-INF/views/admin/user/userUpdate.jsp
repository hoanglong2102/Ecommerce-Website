<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update User</title>

</head>


<body>

	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
				<center><spring:message code="user.add"></spring:message></center>
			</c:if>
			<c:if test="${mode == 'EDIT'}">
				<center><spring:message code="user.update"></spring:message></center>
			</c:if>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/user/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="user">
				<form:input type="hidden" path="id" id="id" />
				<c:if test="${mode == 'EDIT'}">
					<form:input type="hidden" path="userName" id="userName" />
				</c:if>
				<form:input type="hidden" path="password" id="password" />
				<form:input type="hidden" path="isActive" id="isActive" />
				<c:if test="${mode == 'ADD'}">
					<div class="form-group">
						<label for="userName"><spring:message code="user.username"></spring:message></label>
						<form:input path="userName" type="text" class="form-control"
							id="userName" />
					</div>
				</c:if>
				<div class="form-group">
					<label for="firstName"><spring:message
							code="user.firstname"></spring:message></label>
					<form:input required="true" path="firstName" type="text"
						class="form-control" id="firstName" />
				</div>
				<div class="form-group">
					<label for="lastName"><spring:message code="user.lastname"></spring:message></label>
					<form:input path="lastName" type="text" class="form-control"
						id="lastName" />
				</div>
				<div class="form-group">
					<label for="email"><spring:message code="user.email"></spring:message></label>
					<form:input path="email" type="text" class="form-control"
						id="email" pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$ " />
				</div>
				<div class="form-group">
					<label for="phoneNumber"><spring:message code="user.phone"></spring:message></label>
					<form:input path="phoneNumber" type="text" class="form-control"
						id="phoneNumber" pattern="((09|03|07|08|05)+([0-9]{8})\\b)" />
				</div>
				<div class="form-group">
					<label for="loaisp" style="margin-right: 20px;"><spring:message
							code="user.permission"></spring:message> </label>
					<form:select multiple="true" path="permissionID">
						<c:forEach items="${allPermission}" var="dp">
							<c:set var="iselected" value="false" />
							<c:forEach items="${user.permissions}" var="permiss">
								<c:if test="${dp.id == permiss.id}">
									<c:set var="iselected" value="true" />
									<form:option selected="selected" value="${dp.id}">${dp.permissionName}</form:option>
								</c:if>


							</c:forEach>

							<c:if test="${iselected == false }">
								<form:option value="${dp.id}">${dp.permissionName}</form:option>
							</c:if>
						</c:forEach>

					</form:select>
				</div>
				<div class="form-group">
					<label for="profileImageFile"><spring:message
							code="user.image"></spring:message></label> <img
						src="<c:url value="/uploads/${user.profileImage}" />" height="200"
						width="200" />
					<form:input path="profileImageFile" class="form-control"
						id="profileImageFile" name="profileImageFile" type="file" />
				</div>
				<button type="submit" class="btn btn-primary">
					<spring:message code="user.update"></spring:message>
				</button>
			</form:form>
		</div>
	</div>
</body>
</html>
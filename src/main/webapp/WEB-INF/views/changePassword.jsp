<%@ taglib prefix="Spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ChangePassword</title>
<link
	href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<c:url value="/resources/css/forgotpassword.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/css/for-user-password.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">
</head>
<body>
	<c:if test="${not empty errorMessagePass}">
		<div class="alert alert-danger" role="alert">${errorMessagePass}</div>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6 ml-auto mr-auto">
				<div class="card card-login">
					<c:set var="saveUrl"
						value="${pageContext.request.contextPath}/changeNewPassword" />
					<form class="form" action="${saveUrl}" method="post">
						<input type="hidden" value="${userName}" name="userName" />
						<div class="card-header card-header-primary text-center">
							<h4 class="card-title">Đổi mật khẩu</h4>
						</div>
						<div class="card-body">


							<div class="input-group mb-3">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-lock"></i></span>
								</div>
								<input type="password" name="newPassword" class="form-control"
									placeholder="Mật khẩu mới">
							</div>


							<div class="input-group mb-3">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-lock"></i></span>
								</div>
								<input type="password" name="retypePassword"
									class="form-control" placeholder="Xác nhận mật khẩu">
							</div>

						</div>
						<div class="footer text-center">
							<input class="btn btn-primary" type="submit" value="Lưu" />
							<div class="ripple-container"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
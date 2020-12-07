<%@ taglib prefix="Spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head><link
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
	crossorigin="anonymous"></head>
<body class="text-center">
	<%-- <div class="container mt-5 mb-5">
		<h3>Nhap thong tin ca nhan</h3>
		<c:set var="saveUrl"
			value="${pageContext.request.contextPath}/resetPassword" />
		<form method="post" action="${saveUrl}">

			<c:if test="${errorMessage != null}">
				<div class="alert alert-danger" role="alert">${errorMessage }</div>
			</c:if>
			<div class="form-group">
				<input type="text" class="form-control" id="userName"
					name="userName" size="20">
			</div>

			<div class="form-group">
				<input type="text" class="form-control" name="phoneNumber" size="20">
			</div>

			<div class="form-group">
				<input type="text" class="form-control" name="email" size="20">
			</div>

			<input class="btn btn-lg btn-primary btn-block" type="submit"
				value="Tiep Tuc">
	</div> --%>


	</form>
	</div>

	<div class="container forget-password" style="margin-top: 70px;">
		<div class="row">
			<div class="col-md-12 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<img src="https://i.ibb.co/rshckyB/car-key.png" alt="car-key"
								border="0">
							<h2 class="text-center">Quên mật khẩu?</h2>
							<p>Bạn có thể khôi phục lại mật khẩu ở đây.</p>
							<c:set var="saveUrl"
								value="${pageContext.request.contextPath}/resetPassword" />
							<form method="POST" action="${saveUrl}">
								<c:if test="${errorMessage != null}">
									<div class="alert alert-danger" role="alert">${errorMessage }</div>
								</c:if>
								<div class="input-group mb-3">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" name="username"
										class="form-control input_user" id="username" size="20"
										placeholder="Tài khoản cũ của bạn">
								</div>
								
								<div class="input-group mb-3">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-envelope-square"></i></span>
									</div>
									<input type="text" name="email"
										class="form-control input_user" id="email" size="20"
										placeholder="Email của bạn">
								</div>
								
								<div class="input-group mb-3">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
									</div>
									<input type="text" name="phoneNumber"
										class="form-control input_user" id="phoneNumber" size="11"
										placeholder=" Số điện thoại">
								</div>


								<input class="btn btn-lg btn-primary btn-block" type="submit"
									value="Tiếp tục">

							</form>
						</div>
					</div>
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

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
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
<style type="text/css">
body {
	background: url(/uploads/background1.jpg) no-repeat;
	background-position: center;
	background-size: cover;
	margin: 0;
	padding: 0;
}

#log {
	border: 2px solid white;
	padding: 60px 40px;
	margin-top: 80px;
}

.img {
	width: 150px;
	margin-left: 70px;
}

h1 {
	color: white;
	text-align: center;
	font-weight: bolder;
	margin-top: -20px;
}

label {
	font-size: 20px;
	color: white;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<form id="log" method="post" action="login">
					<h1>Login Form</h1>
					<img class="img img-responsive rounded-circle"
						src="/uploads/avatar.png" />
					<div>
						<c:if test="${param.error != null}">
							<div class="alert alert-danger" role="alert">Sai tên đăng
								nhập hoặc mật khẩu</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-danger" role="alert">Bạn đã bị đăng
								xuất</div>
						</c:if>
					</div>
					<div class="form-group">
						<label>Username</label> <input type="text" name="username"
							class="form-control input_user" id="username" size="20"
							placeholder="Tên đăng nhập">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password" name="password"
							class="form-control input_pass" id="password" size="20"
							placeholder="Mật khẩu">
					</div>

					<div class="d-flex justify-content-center mt-3 login_container">
						<button type="submit" name="button"
							class="btn btn-success btn-block">Đăng nhập</button>
					</div>
					<div class="mt-4">

						<div class="d-flex justify-content-center links">
							<a href="<c:url value = "/forgotPassword"/>">Quên mật khẩu?</a>
						</div>
					</div>
			</div>
			</form>
		</div>
	</div>

	<!--  -->
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

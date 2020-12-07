<%@ taglib prefix="Spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>

	<div class="entry-header-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="entry-header">

						<h1 class="entry-title" align="center">
							<Spring:message code="final.cart"></Spring:message>
						</h1>
						<h3 align="center">
							<Spring:message code="final.tks"></Spring:message>
						</h3>
						<p align="center">
							<Spring:message code="final.id"></Spring:message>
							${lastOrderedCart.orderNum}
						</p>
						<div class="buttons-cart">
							<a class="btn btn-primary"
								href="${pageContext.request.contextPath}/"><Spring:message
									code="cart.continue"></Spring:message></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
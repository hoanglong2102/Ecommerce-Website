<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bgBlue fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/"><spring:message
				code="header.shop"></spring:message></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/"><spring:message
							code="header.home"></spring:message> </a></li>
				<li class="nav-item"><a style="color: white" class="nav-link"
					href="${pageContext.request.contextPath}/shop/about"><spring:message
							code="header.about"></spring:message></a></li>
				<li class="nav-item"><a style="color: white" class="nav-link"
					href="${pageContext.request.contextPath}/shop/contact"><spring:message
							code="header.contact"></spring:message></a></li>
				<li class="nav-item"><a style="color: white" class="nav-link"
					href="/shop/shoppingCart"><i class="fas fa-shopping-cart"></i>
						<spring:message code="header.cart">

						</spring:message></a></li>
			</ul>
			<div class="dropdown">
				<a style="color: white" class="nav-link dropdown-toggle" id="dropdownMenuButton"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					href=""><spring:message code="header.lang"></spring:message> </a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/?lang=vi"><spring:message
							code="header.vi"></spring:message></a> <a class="dropdown-item"
						href="${pageContext.request.contextPath}/?lang=en"><spring:message
							code="header.en"></spring:message></a>
				</div>
			</div>
		</div>
	</div>
</nav>

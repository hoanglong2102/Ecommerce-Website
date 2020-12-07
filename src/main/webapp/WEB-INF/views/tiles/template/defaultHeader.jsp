<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav
	class="navbar navbar-dark fixed-top bg-gradient-primary flex-md-nowrap p-0">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#"><spring:message
			code="header.admin"></spring:message></a>
	<div class="px-5 dropdown show">
		<a class="btn white-text dropdown-toggle" role="button"
			id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"
			href="${pageContext.request.contextPath}/profile"> <sec:authentication
				property="principal.username" />
		</a>

		<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			<a class="dropdown-item"
				href="${pageContext.request.contextPath}/admin/order?lang=vi"><spring:message
					code="header.vi"></spring:message></a> <a class="dropdown-item"
				href="${pageContext.request.contextPath}/admin/order?lang=en"><spring:message
					code="header.en"></spring:message></a> <a class="dropdown-item"
				href="${pageContext.request.contextPath}/logout"><i
				class="fas fa-sign-out-alt"></i>&nbsp; <spring:message
					code="header.logout"></spring:message></a> <a class="dropdown-item"
				href="${pageContext.request.contextPath}/profile/myProfile"><i
				class="fas fa-user-tie"></i>&nbsp; <spring:message
					code="header.profile"></spring:message></a> <a class="dropdown-item"
				href="${pageContext.request.contextPath}/changepassword/viewchangepassword?username=<sec:authentication property="principal.username" />"><i
				class="fas fa-lock"></i>&nbsp; <spring:message
					code="header.changepassword"></spring:message></a>
		</div>

	</div>
</nav>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
	<div class="sidebar-sticky">
		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span><spring:message code="menu.admin"></spring:message></span> <a
				class="d-flex align-items-center text-muted" href="#"> <span
				data-feather="plus-circle"></span>
			</a>
		</h6>
		<ul class="nav flex-column">
			<sec:authorize access="hasRole('SUPER_ADMIN')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/user/"> <span
						data-feather="file"></span><i class="fas fa-user-tie"></i> <spring:message
							code="menu.user"></spring:message>
				</a></li>
			</sec:authorize>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/order/"> <span
					data-feather="file"></span><i class="fas fa-file-invoice-dollar"></i>
					<spring:message code="menu.order"></spring:message>
			</a></li>
			<sec:authorize access="hasAnyRole('SUPER_ADMIN', 'MANAGER')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/quanlydanhmuc/">
						<span data-feather="file"></span><i class="fas fa-book"></i> <spring:message
							code="menu.category"></spring:message>
				</a>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('SUPER_ADMIN', 'MANAGER')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/quanlynhasanxuat/">
						<span data-feather="file"></span><i class="fas fa-industry"></i> <spring:message
							code="menu.manufacturer"></spring:message>
				</a>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('SUPER_ADMIN', 'MANAGER')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/quanlysanpham/">
						<span data-feather="shopping-cart"></span><i
						class="fab fa-product-hunt"></i> <spring:message
							code="menu.product"></spring:message>
				</a></li>
			</sec:authorize>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/customer/"> <span
					data-feather="users"></span><i class="fas fa-user-plus"></i> <spring:message
						code="menu.customer"></spring:message>
			</a></li>
		</ul>
	</div>
</nav>
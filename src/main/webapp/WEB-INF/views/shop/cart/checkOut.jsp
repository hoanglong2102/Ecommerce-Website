<%@ taglib prefix="Spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="d-flex justify-content-center">
		<div class="container">
			<div class="row">
				<!-- If error messages -->
				<div id="checkoutError" class=""></div>
				<!--alert-error-->
				<c:if test="${not empty errorMessage }">
					<div class="alert alert-danger" role="alert">${ errorMessage }
					</div>
				</c:if>

				<c:set var="saveUrl"
					value="${pageContext.request.contextPath}/shop/shoppingCartCustomer" />
				<form:form action="${saveUrl }" method="POST"
					modelAttribute="customerInfo">
					<input type="hidden" id="useDistanceWindow"
						name="useDistanceWindow" value="false">

					<div class="col-lg-6 col-md-6">
						<div class="checkbox-form">
							<h3 style="padding-top: 30px;">
								<spring:message code="home.info"></spring:message>
							</h3>
							<h3 style="margin-top: 20px;">
								<spring:message code="home.info2"></spring:message>
							</h3>
							<div class="row">
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label><spring:message code="user.firstname"></spring:message><span
											class="required">*</span></label>
										<form:input path="firstName" id="customer.firstName"
											name="customer.billing.firstName" class="required"
											style="background-color: rgb(255, 255, 204);"
											title="First name is required" autofocus="autofocus"
											type="text" value="" />
										<span id="error-customer.billing.firstName" class="error"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label><spring:message code="user.lastname"></spring:message><span
											class="required">*</span></label>
										<form:input path="lastName" id="customer.lastName"
											name="customer.billing.lastName" class="required"
											style="background-color: rgb(255, 255, 204);"
											title="Last name is required" type="text" value=""
											maxlength="32" />
										<span id="error-customer.billing.lastName" class="error"></span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label><spring:message code="home.street"></spring:message><span
											class="required">*</span></label>

										<form:input path="street" id="customer.billing.address"
											name="customer.billing.address" class="required"
											style="background-color: rgb(255, 255, 204);"
											title="Street address is required" type="text" value="" />
										<span id="error-customer.billing.address" class="error"></span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label><spring:message code="home.district"></spring:message><span
											class="required">*</span></label>

										<form:input path="district" id="customer.billing.address"
											name="customer.billing.address" class="required"
											style="background-color: rgb(255, 255, 204);"
											title="Street address is required" type="text" value="" />
										<span id="error-customer.billing.address" class="error"></span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label><spring:message code="home.city"></spring:message><span
											class="required">*</span></label>
										<form:input path="city" id="customer.billing.city"
											name="customer.billing.city" class="required"
											style="background-color: rgb(255, 255, 204);"
											title="City is required" type="text" />
										<span id="error-customer.billing.city" class="error"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label><spring:message code="user.email"></spring:message><span
											class="required">*</span></label>
										<form:input path="email" id="customer.emailAddress"
											name="customer.emailAddress" class="required"
											style="background-color: rgb(255, 255, 204);"
											title="Email address is required" type="text"
											pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" value="" />
										<span id="error-customer.emailAddress" class="error"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label><spring:message code="user.phone"></spring:message><span
											class="required">*</span></label>
										<form:input path="numberPhone" id="customer.billing.phone"
											name="customer.billing.phone" class="required"
											style="background-color: rgb(255, 255, 204);"
											title="Phone number is required" type="text"
											pattern="((09|03|07|08|05)+([0-9]{8})\\b)" value="" />
										<span id="error-customer.billing.phone" class="error"></span>
									</div>
								</div>

								<div class="col-md-12"></div>

							</div>
							<div id="formErrorMessage" class="alert"></div>
							<div class="order-button-payment">
								<button id="submitOrder" type="submit" class=" 
												">
									<spring:message code="home.order"></spring:message>
								</button>
							</div>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
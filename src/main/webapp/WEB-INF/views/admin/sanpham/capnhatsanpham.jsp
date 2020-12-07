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
.input_information {
	margin-left: 30px;
}

.error {
	color: red;
}

#motasp {
	min-height: 100px;
	max-height: 150px;
	min-width: 50px;
	max-width: 400px;
	width: 250px;
	height: 130px;
}
</style>
</head>
<body>
	<div class="card" style="width: 40rem;">
		<div class="container">
			<h2 class="my-2">
				<center>
					<spring:message code="product.edit"></spring:message>
				</center>
			</h2>
			<div class="card-body">
				<c:set var="saveUrl"
					value="${pageContext.request.contextPath}/admin/quanlysanpham/capnhatsanpham" />
				<form:form method="POST" enctype="multipart/form-data"
				action="${saveUrl}" modelAttribute="sanpham">
				<form:input type="hidden" path="masp" id="masp" />
				<form:input type="hidden" path="hinhanhsp" />
				<div class="form-group">
					<label for="tensp"><spring:message code="product.name"></spring:message></label>
					<form:input path="tensp" id="tensp"  oninvalid = "this.setCustomValidity('Tên sản phẩm không được rỗng!')"  oninput="setCustomValidity('')" required="true"
						class="input_information" />
					<form:errors path="tensp" cssClass="error" />
				</div>
			    <div class="form-group">
					<label for="giacu" style="margin-left: 77px;"><spring:message
							code="product.price"></spring:message> </label>
					<form:input path="giacu" id="giacu" oninvalid = "if(this.value == '') this.setCustomValidity('Giá sản phẩm không được rỗng!'); else if(this.value <= 0) this.setCustomValidity('Giá sản phẩm không được số âm!');"  oninput="setCustomValidity('')" min="0" step="any" required="true" type="number"
						class="input_information" />
					<form:errors path="giacu" cssClass="error" />
				</div>
				<div class="form-group">
					<label for="giamgia" style="margin-left: 37px;"><spring:message
							code="product.discount"></spring:message> </label>
					<form:input path="giamgia" id="giamgia" oninvalid = "if(this.value <= 0) this.setCustomValidity('Giảm giá không được số âm!');"  oninput="setCustomValidity('')" min="0" step="any" required="true" type="number" class="input_information"/>
					<form:errors path="giamgia" cssClass="error" />
				</div>
				<div class="form-group">
					<label for="soluong" style="margin-left: 30px;"><spring:message
							code="product.quantity"></spring:message> </label>
					<form:input path="soluong" id="soluong" oninvalid = "if(this.value <= 0) this.setCustomValidity('Số lượng không được số âm!');"  oninput="setCustomValidity('')" min="0" step="any" required="true" type="number" class="input_information"/>
					<form:errors path="soluong" cssClass="error" />
				</div>
				<div class="form-group">
					<label for="mota" style="margin-left: 55px;"><spring:message
							code="product.description"></spring:message> </label>
				  <form:textarea path="motasp" id="motasp"  class="input_information"/>		
					<form:errors path="motasp" cssClass="error" />
				</div>
				<div class="form-group">
					<label for="loaisp"><spring:message code="product.category"></spring:message></label>
					<form:select multiple="true" path="danhmucID"
					oninvalid = "this.setCustomValidity('Hãy chọn loại sản phẩm!')"  oninput="setCustomValidity('')" required="true" class="input_information">
						<c:forEach items="${dsdm}" var="dm">
							<c:set var="iselected" value="false" />
							<c:forEach items="${sanpham.danhmuc }" var="danhmuc">
								<c:if test="${danhmuc.madm == dm.madm }">
									<c:set var="iselected" value="true" />
									<form:option selected="selected" value="${dm.madm}">${dm.tendm}</form:option>
								</c:if>
							</c:forEach>
							<c:if test="${iselected == false }">
								<form:option value="${dm.madm}">${dm.tendm}</form:option>
							</c:if>

						</c:forEach>

					</form:select>
				</div>
				<div class="form-group">
					<label for="loaisp"><spring:message
							code="product.manufacturer"></spring:message> </label>
					<form:select path="manufacturer" oninvalid = "this.setCustomValidity('Hãy chọn nhà sản xuất!')"  oninput="setCustomValidity('')" required="true" class="input_information">
					     <form:option value="">None</form:option>
						<c:forEach items="${manufacturers}" var="ms">
							<form:option value="${ms.maNSX}">${ms.tenNSX}</form:option>
						</c:forEach>

					</form:select>
				</div>
				<div class="form-group">
					<label for="hinhanhsp"><spring:message
							code="product.choose"></spring:message> </label>
					<form:input path="imageFile" class="form-control" id="hinhanhsp"
						name="hinhanhsp" type="file" />
				</div>
				<button type="submit" class="btn btn-primary">
					<spring:message code="product.update"></spring:message>
				</button>
			</form:form>
			</div>
		</div>
	</div>
</body>
</html>
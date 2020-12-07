<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<center>
			<spring:message code="menu.manufacturer"></spring:message>
		</center>
	</h2>

	<c:choose>
		<c:when test="${ketqua}">
			<h1 style="font-size: 18px;">${message}</h1>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th><spring:message code="manufacturer.id"></spring:message></th>
							<th><spring:message code="manufacturer.name"></spring:message></th>
							<th><spring:message code="manufacturer.update"></spring:message></th>
							<th><spring:message code="manufacturer.delete"></spring:message></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${manufacturers}" var="m">
							<tr>
								<td><a
									href="<c:url value='/admin/quanlynhasanxuat/${m.maNSX}?mode=VIEW' />">${m.maNSX}</a></td>
								<td>${m.tenNSX}</td>
								<td><a
									href="<c:url value='/admin/quanlynahsanxuat/${m.maNSX}?mode=EDIT' />"><i
										class="fas fa-edit"></i></a></td>
								<td><a
									href="<c:url value='/admin/quanlynhasanxuat/xoanhasanxuat/${m.maNSX}' />"><i
										class="fas fa-trash"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</c:when>
		<c:otherwise>
			<h4>
				<spring:message code="manufacturer.error"></spring:message>
			</h4>
		</c:otherwise>
	</c:choose>

</body>
</html>
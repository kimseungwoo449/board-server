<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${empty sessionScope.user }">
		<c:redirect url="/login"></c:redirect>
	</c:if>
	
	<%--<%
	if (session.getAttribute("user") == null)
		response.sendRedirect("/login");
	%>--%>
	
	<section id="root">
		<h2>탈퇴하기</h2>
		<form method="POST" action="/deleteFormAction">
			<div>
				<input type="hidden" name="id" value="${user.id}"> 
				<input type="password" id="password" name="password" placeholder="비밀번호 재입력">
			</div>
			<input type="submit" value="탈퇴하기">
		</form>
	</section>
</body>
</html>
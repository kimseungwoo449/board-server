<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/style/form.css">
</head>
<jsp:include page="/header"></jsp:include>
<body>
	<%
	if (session.getAttribute("user") == null)
		response.sendRedirect("/login");
	%>
	<section id="root">
		<h2>회원 정보 수정</h2>
		<form method="POST" action="/UpdateUserFormPro">
			<div>
				<input type="hidden" name="cur-id"value="${user.id}">
				<input type="password" id="password" name="password"
					placeholder="현재 비밀번호"> <input type="password"
					id="new-password" name="new-password" placeholder="새로운 비밀번호">
				<input type="text" id="email" name="new-email"
					placeholder="이메일주소"> <input type="text"
					id="phone" name="new-phone" placeholder="휴대전화번호">
			</div>
			<input type="submit" value="회원정보수정">
		</form>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>
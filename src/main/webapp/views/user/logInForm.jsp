<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<c:import url="/header"></c:import>
<body>
	<section id="root">
		<h2>로그인</h2>
		<form method="POST" action="/loginFormAction">
			<div>
				<input type="text" id="id" name="id" placeholder="아이디"> 
				<input type="password" id="password" name="password" placeholder="비밀번호">
			</div>
			
			<input type="submit" value="로그인">
		</form>
		<button onclick="location.href='/join'">회원가입</button>
	</section>
</body>
<c:import url="footer"></c:import>
</html>
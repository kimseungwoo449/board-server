<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:include page="/header"></jsp:include>
<body>
	<section id="root">
		<h2>로그인</h2>
		<form method="POST" action="/logInPro">
			<div>
				<input type="text" id="id" name="id" placeholder="아이디"> 
				<input type="password" id="password" name="password" placeholder="비밀번호">
			</div>
			
			<input type="submit" value="로그인">
		</form>
		<button onclick="location.href='/join'">회원가입</button>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>
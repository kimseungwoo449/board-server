<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<c:import url="/header"></c:import>
<body>
	<section id="root">
		<h1>${user.name}님 환영합니다!</h1>
		<button onclick="location.href='/updateUserForm'">회원정보 수정</button>
		<button onclick="location.href='/delete'">회원 탈퇴</button>
	</section>
</body>
<c:import url="/footer"></c:import>
</html>
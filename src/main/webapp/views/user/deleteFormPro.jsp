<%@page import="boardServer.user.UserRequestDto"%>
<%@page import="boardServer.user.UserResponseDto"%>
<%@page import="boardServer.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	boolean isValid = true;

	if (password == null || password.equals(""))
		isValid = false;
	
	if(!isValid){
		response.sendRedirect("/mypage");
	}else{
		UserDao userDao = UserDao.getInstance();
		UserResponseDto loginUser = (UserResponseDto) session.getAttribute("user");
		UserResponseDto targetUser = userDao.findUserByIdAndPassword(id, password);
	
		if (targetUser != null && targetUser.getId().equals(loginUser.getId())) {
			UserRequestDto user = new UserRequestDto(id, password);
			userDao.deleteUser(user);
			response.sendRedirect("/logIn");
		}else{
			response.sendRedirect("/mypage");
		}
	}
	%>
</body>
</html>
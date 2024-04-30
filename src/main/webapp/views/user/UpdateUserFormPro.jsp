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

	String curId = request.getParameter("cur-id");
	String curPassword = request.getParameter("password");
	String newPassword = request.getParameter("new-password");
	String newEmail = request.getParameter("new-email");
	String newPhone = request.getParameter("new-phone");

	boolean isValid = true;

	if (curId == null || curId.equals("") || curPassword == null || curPassword.equals(""))
		isValid = false;

	if (!isValid) {
		response.sendRedirect("/updateUserForm");
	} else {
		UserDao userDao = UserDao.getInstance();
		UserResponseDto loginUser = (UserResponseDto) session.getAttribute("user");
		UserResponseDto targetUser = userDao.findUserByIdAndPassword(curId, curPassword);

		if (targetUser != null && targetUser.getId().equals(loginUser.getId())) {
			UserRequestDto user = new UserRequestDto(curId, curPassword);
			UserResponseDto temp = null;
			if (newEmail != null&&!newEmail.equals("")) {
				temp = userDao.updateUserEmail(user, newEmail);
				System.out.println("이메일 수정성공");
			}

			if (newPhone != null&&!newPhone.equals("")) {
				temp =userDao.updateUserPhone(user, newPhone);
				System.out.println("폰번 수정성공");
			}

			if (newPassword != null&&!newPassword.equals("")) {
				System.out.println("비밀번호 수정성공");
				temp =userDao.updateUserPassword(user, newPassword);
			}
			session.setAttribute("user", temp);
			response.sendRedirect("/mypage");
			
		} else{
			response.sendRedirect("/updateUserForm");
		}
	}
	%>
</body>
</html>
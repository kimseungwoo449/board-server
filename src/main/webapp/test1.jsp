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
String pageData = (String)pageContext.getAttribute("test");
String requestData = (String)request.getAttribute("test");
String sessionData = (String)session.getAttribute("test");
String applicationData = (String)application.getAttribute("test");

out.print(String.format("<p>pageData : <b>%s</p>",pageData));
out.print(String.format("<p>requestData : <b>%s</p>",requestData));
out.print(String.format("<p>sessionData : <b>%s</p>",sessionData));
out.print(String.format("<p>applicationData : <b>%s</p><br>",applicationData));
%>

<!-- JSP EL(Expression language) Tag -->
<p>${pageScope.test}</p> 
<p>${requestScope.test}</p> 
<p>${sessionScope.test}</p> 
<p>${applicationScope.test}</p> 

<!-- Default 참조 영역 확인용 -->
<p>${test}</p> 
<button onclick="location.href='/test2.jsp'">Test2로 이동</button>
</body>
</html>
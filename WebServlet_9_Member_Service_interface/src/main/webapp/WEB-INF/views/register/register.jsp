<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="${ pageContext.request.contextPath}/registerok.do?" method = "post">
		ID : 	<input type="text"		 name="id" 		placeholder ="id 입력" 		required="required"><br>
		PWD : 	<input type="password"   name="pwd" 	placeholder ="pwd 입력" 		required="required"><br>
		EMAIL : <input type="text"		 name="email" 	placeholder ="email 입력" 	required="required"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>
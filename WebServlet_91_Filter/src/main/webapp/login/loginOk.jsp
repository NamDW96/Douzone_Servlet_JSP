<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	/*
		1.한글처리
		2.데이터받기
		
		한글처리 (모든 페이지 적용 ) >> 공통 관심
		공통관심(보조관심) 분리하자 (한곳에서 통합 관리) >> WAS >> filter 
	*/
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	한글명 : ${param.kor} <br>
	영문명 : ${param.eng}
</body>
</html>
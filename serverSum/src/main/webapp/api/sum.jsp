<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
/*
변수 영역 
	전역 변수 : 누구나 해당 변수를 읽고 쓸 수 있다(실수에 의해서 값을 변경할 수 있다)
	멤버 변수 : 
	지역 변수 : 
		
웹 변수 영역 
	application 영역 : 전역변수  
	session 영역 : 
	request 영역 : 해당 요청시 사용되는 영역(forword시 값을 공유 할 수 있음 )
	page 영역 : jsp 페이지에서 사용되는 일종의 지역변수  
	header 영역 : 클라이언트가 서버에 자료를 전달할 때 또는 
	              서버가 응답을 처리하고 클리라이언트에 
	              결과를 줄 때 앞 부분에 전달 되는 자료를 header
	cookie 영역 : session과 유사한 것으로 저장공간이 브라우저영역  

	
	
*/
String uuid = request.getParameter("uuid");
if (uuid == null || uuid.length() == 0) {
	JSONObject jsonResult = new JSONObject();
	jsonResult.put("status", -1);
	jsonResult.put("result", 0);
	jsonResult.put("message", "uuid가 존재하지 않습니다");

	out.clear();
	out.println(jsonResult.toString());
	return;
}
int result = 0;
String message = "1 ~ 1000 까지의 합계를 구함";

session.setAttribute("loop", true);
System.out.println("합계 구할 때 sessioId = " + session.getId());

for (int i=1;i<=1000;i++) {
	if (!(Boolean)application.getAttribute("loop_" + uuid)) {
		message = "취소되었습니다";
		break;
	}
	result += i;
	try {
		Thread.sleep(10);
	} catch (Exception e) {
		
	}
//	System.out.println("합계 구할 때 uuid = " + uuid + "     i = " + i);
}
application.removeAttribute("loop_" + uuid);

JSONObject jsonResult = new JSONObject();
jsonResult.put("status", (Boolean)session.getAttribute("loop") ? 1 : -2);
jsonResult.put("result", result);
jsonResult.put("message", message);

out.clear();
out.println(jsonResult.toString());

%>
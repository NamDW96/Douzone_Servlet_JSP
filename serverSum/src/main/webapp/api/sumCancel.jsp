<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String uuid = request.getParameter("uuid");
System.out.println("uuid = " + uuid);
if (uuid == null || uuid.length() == 0) {
	JSONObject jsonResult = new JSONObject();
	jsonResult.put("status", -1);
	jsonResult.put("result", 0);
	jsonResult.put("message", "uuid가 존재하지 않습니다");

	out.clear();
	out.println(jsonResult.toString());
	return;
}

System.out.println("취소시 sessioId = " + session.getId());

application.setAttribute("loop_" + uuid, false);
//"{\"status\":1,\"message\":'취소를 설정하였습니다'}"
JSONObject jsonResult = new JSONObject();
jsonResult.put("status", 1);
jsonResult.put("message", "취소를 설정하였습니다");
out.clear();
out.println(jsonResult);
%>
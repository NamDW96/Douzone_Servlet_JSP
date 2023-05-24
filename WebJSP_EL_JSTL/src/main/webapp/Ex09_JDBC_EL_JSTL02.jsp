<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DTO.Emp"%>
<%@page import="DAO.EmpDAO"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	EmpDAO ed = new EmpDAO();
	List<Emp> emplist = ed.getEmpAllList();
	request.setAttribute("emplist", emplist);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<div class="container">
		<table>
			<thead>
				<tr class="table-primary">
					<th>사원번호</th>
					<th>사원이름</th>
					<th>직종</th>
					<th>사수번호</th>
					<th>입사일</th>
					<th>급여</th>
					<th>성과급</th>
					<th>부서번호</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="showmetheemp" items="${requestScope.emplist}">
					<tr class="table-info">
						<td>${showmetheemp.empno}</td>
						<td>${showmetheemp.ename}</td>
						<td>${showmetheemp.job}</td>
						<td>${showmetheemp.mgr}</td>
						<td>${showmetheemp.hiredate}</td>
						<td>${showmetheemp.sal}</td>
						<td>${showmetheemp.comm}</td>
						<td>${showmetheemp.deptno}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
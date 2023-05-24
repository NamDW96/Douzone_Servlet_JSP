<!DOCTYPE html>
<%@page import="DTO.Dept"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DeptDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	DeptDao dao = new DeptDao();
	List<Dept> deptlist = dao.getDeptAllList();
	request.setAttribute("list", deptlist);
	//out.print(request.getAttribute("list"));
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="container">
    <table> 
        <thead>
           <tr>
		      <th>deptno</th>
		      <th>dname</th>
		      <th>loc</th>
	       </tr>
        </thead>
        <tbody>
     
							<c:forEach var="dept" items="${requestScope.list}">
								<tr>
									<td>${dept.deptno}</td>
									<td>${dept.dname}</td>
									<td>${dept.loc}</td>
								</tr>
							</c:forEach>
	    </tbody>
	 </table>   
   </div>
   
</body>
<style>
    .container {
       width: 100vw;
       height: 100vh;
       display: flex;
       align-items : center;
       justify-content: center;
       
    }
    
	table {
	  border-collapse: collapse;
	  width: 50vw;
	}
	
	th, td {
	  padding-top : 2vh;
	  padding-bottom: 2vh;
	  text-align: center;
	}
	
	tbody > th, td {
	  border-bottom: 1px solid #444444;
	}
	
	thead {
	  background-color: #D5DEDC;
	  color: #5F7065;
	}
</style>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_auth.model.*"%>
<%@ page import="com.fun_auth.model.*"%>
<%@ page import="java.util.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<% 
  List<Emp_authVO> emp_authVO = (List<Emp_authVO>) request.getAttribute("emp_authVO"); //Emp_authServlet.java(Concroller), 存入req的emp_authVO物件
%>

<%
  List<Fun_authVO> fun_authVO = (List<Fun_authVO>) request.getAttribute("fun_authVO");
%>

<html>
<head>
<title>員工資料</title>

<style>
	#loc{
		position: absolute;
		top: 150px;
		left: 300px;
		z-index: 10;
	}
</style>

</head>
<body>
	
	<div id="loc">
	<h4><a href="select_page.jsp">回首頁</a></h4>
	<h3>員工資料</h3>

<table>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>在職狀態</th>
		<th>權限內容</th>
		<th>狀態修改</th>
		<th>權限新增</th>
		<th>權限刪除</th>
	</tr>
	<tr>
		<td>${empVO.emp_no}</td>
		<td>${empVO.emp_name}</td>
		<td>${(empVO.emp_sts==1) ? "在職" : "離職"}</td>

		<td>
			<c:forEach var="fun_authVO" items="${fun_authVO}">
				${fun_authVO.fun_name}<br>
			</c:forEach>
		</td>
		
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				<input type="submit" value="狀態修改">
				<input type="hidden" name="emp_no" value="${empVO.emp_no}">
				<input type="hidden" name="action"	value="Update_sts">
			</FORM>
		</td>
		
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				<input type="submit" value="權限新增">
				<input type="hidden" name="emp_no" value="${empVO.emp_no}">
				<input type="hidden" name="action" value="Update_auth">
			</FORM>
		</td>
		
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				<input type="submit" value="權限刪除">
				<input type="hidden" name="emp_no" value="${empVO.emp_no}">
				<input type="hidden" name="emp_name" value="${empVO.emp_name}">
				<input type="hidden" name="emp_sts" value="${empVO.emp_sts}">
				<input type="hidden" name="action" value="delete_emp_auth">
			</FORM>
		</td>
	</tr>
	
</table>
	</div>
	
	<jsp:include page="/back-end/siderbar/siderbar.jsp" />

</body>
</html>
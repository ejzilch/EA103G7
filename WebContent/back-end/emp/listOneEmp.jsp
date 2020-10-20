<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_auth.model.*"%>
<%@ page import="com.fun_auth.model.*"%>
<%@ page import="java.util.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<% 
  List<Emp_authVO> emp_authVO = (List<Emp_authVO>) request.getAttribute("emp_authVO"); //Emp_authServlet.java(Concroller), �s�Jreq��emp_authVO����
%>

<%
  List<Fun_authVO> fun_authVO = (List<Fun_authVO>) request.getAttribute("fun_authVO");
%>

<html>
<head>
<title>���u���</title>

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
	<h4><a href="select_page.jsp">�^����</a></h4>
	<h3>���u���</h3>

<table>
	<tr>
		<th>���u�s��</th>
		<th>���u�m�W</th>
		<th>�b¾���A</th>
		<th>�v�����e</th>
		<th>���A�ק�</th>
		<th>�v���s�W</th>
		<th>�v���R��</th>
	</tr>
	<tr>
		<td>${empVO.emp_no}</td>
		<td>${empVO.emp_name}</td>
		<td>${(empVO.emp_sts==1) ? "�b¾" : "��¾"}</td>

		<td>
			<c:forEach var="fun_authVO" items="${fun_authVO}">
				${fun_authVO.fun_name}<br>
			</c:forEach>
		</td>
		
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				<input type="submit" value="���A�ק�">
				<input type="hidden" name="emp_no" value="${empVO.emp_no}">
				<input type="hidden" name="action"	value="Update_sts">
			</FORM>
		</td>
		
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				<input type="submit" value="�v���s�W">
				<input type="hidden" name="emp_no" value="${empVO.emp_no}">
				<input type="hidden" name="action" value="Update_auth">
			</FORM>
		</td>
		
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				<input type="submit" value="�v���R��">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<html>
<head>
<title>���u�Ӹ�ק�</title>

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
	<h1>��榨�\</h1><br>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
	<table>
		<tr>
			<th colspan=2 align=center>
				���u�Ӹ�ק�
			</th>
		</tr>
		<tr>
			<td>���u�s��:</td><td>${empVO.emp_no}</td>
		</tr>
		<tr>
			<td>���u�m�W:</td><td><input type="text" name="emp_name" value="<%=empVO.getEmp_name()%>" required></td>
		</tr>
		<tr>
			<td>�K�X�ק�:</td><td><input type="password" name="emp_psw1" value="" required></td>
		</tr>
		<tr>
			<td>�K�X�T�{:</td><td><input type="password" name="emp_psw2" value="" required></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
						
				<input type=submit value="�T�{�e�X">
				<input type="hidden" name="emp_no" value="${empVO.emp_no}">
				<input type="hidden" name="action" value="update_i">
						
			</td>
		</tr>
	</table>
	</FORM>
	</div>
	
	<jsp:include page="/back-end/siderbar/siderbar.jsp" />

</body>
</html>
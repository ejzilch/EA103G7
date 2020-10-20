<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_auth.model.*"%>
<%@ page import="java.util.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<%
  List<Emp_authVO> emp_authVO = (List<Emp_authVO>) request.getAttribute("emp_authVO"); //Emp_authServlet.java (Concroller) �s�Jreq��emp_authVO���� (�]�A�������X��emp_authVO, �]�]�A��J��ƿ��~�ɪ�emp_authVO����)
%>

<%
  String emp_no = new String(request.getParameter("emp_no").trim());
  Emp_authService emp_authService = new Emp_authService();
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u���A�ק�</title>

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
	<h3>���u���A�ק�</h3>
	
	<h3>���A�ק�:</h3>
	
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<FORM METHOD="post" ACTION="emp.do" name="form1">
	<table>
		<tr>
			<td>���u�s��:</td>
			<td><%=empVO.getEmp_no()%></td>
		</tr>
		<tr>
			<td>���u�m�W:</td>
			<td><%=empVO.getEmp_name()%></td>
		</tr>
		
		<tr>
			<td>���A:<font color=red><b>*</b></font></td>
			<td><select size="1" name="emp_sts">
				<option value="${(empVO.emp_sts==1) ? 1 : 0}" >${(empVO.emp_sts==1) ? "�b¾" : "��¾"}
				<option value="${(empVO.emp_sts==1) ? 0 : 1}" >${(empVO.emp_sts==1) ? "��¾" : "�b¾"}
			</select></td>
		</tr>
	
	</table>
	<br>
	<input type="hidden" name="action" value="update_s">
	<input type="hidden" name="emp_no" value="<%=empVO.getEmp_no()%>">
	<input type="hidden" name="emp_name" value="<%=empVO.getEmp_name()%>">
	
	<input name="fun_no[]" type="hidden" value="<%=emp_authService.getOneEmp_auth(emp_no)%>">

	<input type="submit" value="�e�X�ק�">
	</FORM>
	</div>
	
	<jsp:include page="/back-end/siderbar/siderbar.jsp" />

</body>
</html>
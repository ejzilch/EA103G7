<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��Ʒs�W</title>

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
	<h4><a href="select_page.jsp">�^�D��</a></h4>
	<h3>���u��Ʒs�W</h3>
	
	<h3>��Ʒs�W:</h3>
	
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
			<td>���u�m�W:</td>
			<td><input type="TEXT" name="emp_name" size="45" 
				 value="" placeholder="�п�J���u�m�W" /></td>
		</tr>
	</table>
	<br>
	
	<jsp:useBean id="fun_authSvc" scope="page" class="com.fun_auth.model.Fun_authService" />
		
		�v���s�W:<font color=red><b>*</b></font><br>
			
		<c:forEach var="fun_authVO" items="${fun_authSvc.all}">
			<span class="textcolor"><label><input class="check1" name="fun_no[]" type="checkbox" value="${fun_authVO.fun_no}">${fun_authVO.fun_name}</label></span>
		</c:forEach>
	
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
	</FORM>
	</div>
	
	<jsp:include page="/back-end/siderbar/siderbar.jsp" />
	
</body>
</html>
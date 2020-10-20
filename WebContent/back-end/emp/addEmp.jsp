<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料新增</title>

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
	<h4><a href="select_page.jsp">回主頁</a></h4>
	<h3>員工資料新增</h3>
	
	<h3>資料新增:</h3>
	
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<FORM METHOD="post" ACTION="emp.do" name="form1">
	<table>
		<tr>
			<td>員工姓名:</td>
			<td><input type="TEXT" name="emp_name" size="45" 
				 value="" placeholder="請輸入員工姓名" /></td>
		</tr>
	</table>
	<br>
	
	<jsp:useBean id="fun_authSvc" scope="page" class="com.fun_auth.model.Fun_authService" />
		
		權限新增:<font color=red><b>*</b></font><br>
			
		<c:forEach var="fun_authVO" items="${fun_authSvc.all}">
			<span class="textcolor"><label><input class="check1" name="fun_no[]" type="checkbox" value="${fun_authVO.fun_no}">${fun_authVO.fun_name}</label></span>
		</c:forEach>
	
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="送出新增">
	</FORM>
	</div>
	
	<jsp:include page="/back-end/siderbar/siderbar.jsp" />
	
</body>
</html>
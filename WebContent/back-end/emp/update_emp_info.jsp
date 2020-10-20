<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<html>
<head>
<title>員工個資修改</title>

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
	<h1>轉交成功</h1><br>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
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
				員工個資修改
			</th>
		</tr>
		<tr>
			<td>員工編號:</td><td>${empVO.emp_no}</td>
		</tr>
		<tr>
			<td>員工姓名:</td><td><input type="text" name="emp_name" value="<%=empVO.getEmp_name()%>" required></td>
		</tr>
		<tr>
			<td>密碼修改:</td><td><input type="password" name="emp_psw1" value="" required></td>
		</tr>
		<tr>
			<td>密碼確認:</td><td><input type="password" name="emp_psw2" value="" required></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
						
				<input type=submit value="確認送出">
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
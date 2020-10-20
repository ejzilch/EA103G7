<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<% 
	MemVO memVO = (MemVO) request.getAttribute("memVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�|�����</title>

<style>
	
</style>

</head>
<body>
	
	
<!-- 	<h4><a href="select_page.jsp">�^�D��</a></h4> -->
	<h3>�|�����</h3>
	
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<FORM METHOD="post" ACTION="mem.do" name="form1">
	<table>
		<tr>
			<td>�|���s��:</td>
			<td>${memVO.mem_no}</td>
		</tr>
		<tr>
			<td>�|���m�W:</td>
			<td>${memVO.mem_name}</td>
		</tr>
		<tr>
			<td>�b��:</td>
			<td>${memVO.mem_act}</td>
		</tr>
		<tr>
			<td>�ʧO:</td>
			<td>${memVO.mem_gen}</td>
		</tr>
		<tr>
			<td>�ͤ�:</td>
			<td>${memVO.mem_bir}</td>
		</tr>
		<tr>
			<td>���:</td>
			<td>${memVO.mem_tel}</td>
		</tr>
		<tr>
			<td>�a�}:</td>
			<td>${memVO.mem_adrs}</td>
		</tr>
		<tr>
			<td>e-mail:</td>
			<td>${memVO.mem_mail}</td>
		</tr>
		<tr>
			<td>���Q�I��:</td>
			<td>${(memVO.mem_bns == null) ? 0 : memVO.mem_bns}</td>
		</tr>
		<tr>
			<td>�O�_�i�q�\:</td>
			<td>${(memVO.mem_od_m == 0) ? "���i" : "�i"}</td>
		</tr>
		<tr>
			<td>�O�_�i�q��:</td>
			<td>${(memVO.mem_od_r == 0) ? "���i" : "�i"}</td>
		</tr>
		<tr>
			<td>�O�_�i����:</td>
			<td>${(memVO.mem_review == 0) ? "���i" : "�i"}</td>
		</tr>
		<tr>
			<td>�O�_�i���|:</td>
			<td>${(memVO.mem_repo == 0) ? "���i" : "�i"}</td>
		</tr>
	</table>
		
		<input type="submit" value="�Ӹ�ק�">
		<input type="hidden" name="mem_no" value="${memVO.mem_no}">
		<input type="hidden" name="action" value="Update_info">
	
	</FORM>
	

	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_auth.model.*"%>
<%@ page import="com.fun_auth.model.*"%>
<%@ page import="java.util.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<% 
  List<Emp_authVO> emp_authVO = (List<Emp_authVO>) request.getAttribute("emp_authVO");
%>

<%
  List<Fun_authVO> fun_authVO = (List<Fun_authVO>) request.getAttribute("fun_authVO");
%>

<html>
<head>
<title>�n�J���\</title>

<style>

#loginName {
	position: absolute;
	top: 10px;
	right: 60px;
}

#logout {
	position: absolute;
	top: 10px;
	right: 10px;
}

.unshow{
 	display: none;
}

</style>

</head>
<body>
	<h1>�n�J���\</h1><br>
	
	<span id="loginName">${empVO.emp_name}�A�z�n�I</span>
	
	<form style="margin: 0px;display: inline" method="post" action="<%=request.getContextPath()%>/back-end/emp/emp.do">
        <input type="hidden" name="action" value="logout"> 
        <label style="cursor:pointer" id="logout" >�n�X
        <input type="submit" name="logout" style="display:none"></label>  
    </form>
	
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
		<input type="submit" value="���u�Ӹ�ק�">
		<input type="hidden" name="emp_no" value="${empVO.emp_no}">
		<input type="hidden" name="action" value="Update_info">
	</FORM>
	
	<table>
		<tr><th>�\��C��</th></tr>
		<tr><td><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp">���u�޲z</a></td></tr>
		<tr><td><a href="">�|���޲z</a></td></tr>
		<tr><td><a href="">���i�Y�ɳq�T</a></td></tr>
		<tr><td><a href="">�d�ݳq��</a></td></tr>
		<tr><td><a href="">�{���I�\</a></td></tr>
		<tr><td><a href="">�{������</a></td></tr>
		<tr><td><a href="">�Ԧ�޲z</a></td></tr>
		<tr><td><a href="">�q�浲�b</a></td></tr>
		<tr><td><a href="">�q�欣�u</a></td></tr>
		<tr><td><a href="">�X�\�޲z</a></td></tr>
		<tr><td><a href="">�q�\�q��B�z</a></td></tr>
		<tr><td><a href="">�q�\�޲z</a></td></tr>
		<tr><td><a href="">�q��޲z</a></td></tr>
		<tr><td><a href="">�q��޲z</a></td></tr>
		<tr><td><a href="">���Q�ӫ~�޲z</a></td></tr>
		<tr><td><a href="">���޲z</a></td></tr>
		<tr><td><a href="">���\��~�ɬq�޲z</a></td></tr>
		<tr><td><a href="">�̷s�����޲z</a></td></tr>
		<tr><td><a href="">�s�i�޲z</a></td></tr>
		<tr><td><a href="">���޲z</a></td></tr>
		<tr><td><a href="">�����޲z</a></td></tr>
		<tr><td><a href="">�q���޲z</a></td></tr>
		<tr><td><a href="">�����޲z</a></td></tr>
		<tr><td><a href="">�\�I�զ��޲z</a></td></tr>
		<tr><td><a href="">�������Ӳέp</a></td></tr>
	</table>
	
		<div id="fun" style="display:none">
			<c:forEach var="fun_authVO" items="${fun_authVO}">
				<span class="fun">${fun_authVO.fun_name}</span><br>
			</c:forEach>
		</div>
		
	<script>
		
		var fun = document.getElementsByClassName("fun");
		var arr1 = [];
		for (let i = 0; i < fun.length; i++) {
			var x = fun[i].innerText;
			arr1.push(x);
		}
		
		console.log(arr1);
		
		var td = document.getElementsByTagName("td");
		var arr2 = [];
		for (let i = 0; i < td.length; i++) {
			var y = td[i].innerText;
			arr2.push(y);
		}
		
		console.log(arr2);
		
		for (let i = 0; i < arr2.length; i++) {
			var allow = true;
			for (let j = 0; j < arr1.length; j++) {
				if (arr2[i] === arr1[j]) {
					allow = false;
					break;
				}
			}
			if (allow) {
				td[i].setAttribute('class', 'unshow');
			}
		}
	
	</script>
		
</body>
</html>
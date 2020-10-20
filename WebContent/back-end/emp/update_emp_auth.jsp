<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_auth.model.*"%>
<%@ page import="com.fun_auth.model.*"%>
<%@ page import="java.util.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<%
  List<Fun_authVO> fun_authVO = (List<Fun_authVO>) request.getAttribute("fun_authVO");
%>

<% 
  List<Emp_authVO> emp_authVO = (List<Emp_authVO>) request.getAttribute("emp_authVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工權限修改</title>

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
	<h3>員工權限修改</h3>

	<h3>權限修改:</h3>
	
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
			<td>員工編號:</td>
			<td><%=empVO.getEmp_no()%></td>
		</tr>
		<tr>
			<td>員工姓名:</td>
			<td><%=empVO.getEmp_name()%></td>
		</tr>
	</table>
			
		<jsp:useBean id="fun_authSvc" scope="page" class="com.fun_auth.model.Fun_authService" />
		
			權限新增:<font color=red><b>*</b></font><br>
			
			<c:forEach var="fun_authVO" items="${fun_authSvc.all}">
				<span class="textcolor"><label><input class="check1" name="fun_no[]" type="checkbox" value="${fun_authVO.fun_no}">${fun_authVO.fun_name}</label></span>
			</c:forEach>		
			
	<br>
	<input type="hidden" name="action" value="update_a">
	<input type="hidden" name="emp_no" value="<%=empVO.getEmp_no()%>">
	<input type="hidden" name="emp_name" value="<%=empVO.getEmp_name()%>">
	<input type="hidden" name="emp_sts" value="<%=empVO.getEmp_sts()%>">
	<input type="submit" id="ok" value="送出修改">
	
	<div id="fun" style="display:none">
		<c:forEach var="emp_authVO" items="${emp_authVO}">
			<span class="check2">${emp_authVO.fun_no}</span>
		</c:forEach>
	</div>
	</FORM>
	</div>

	<jsp:include page="/back-end/siderbar/siderbar.jsp" />
	
<script>
	
	var check1 = document.getElementsByClassName("check1");
	var arr1 = [];
	for (let i = 0; i < check1.length; i++) {
		var x = check1[i].value;
		arr1.push(x);
	}
	
	console.log(arr1);
	
	var check2 = document.getElementsByClassName("check2");
	var arr2 = [];
	for (let i = 0; i < check2.length; i++) {
		var y = check2[i].innerText;
		arr2.push(y);
	}
	
	console.log(arr2);
	
	var textcolor = document.getElementsByClassName("textcolor");
	
	for (let i = 0; i < arr1.length; i++) {
		for (let j = 0; j < arr2.length; j++) {
			if (arr1[i] === arr2[j]) {
				check1[i].disabled = true;
				textcolor[i].style.color = 'red';
			}
		}
	}
	
	var btn = document.getElementById("ok");
	
	btn.onclick = function(e){
	    var obj = document.getElementsByName("fun_no[]");
	    var selected = [];
	    for (var i = 0; i < obj.length; i++) {
	        if (obj[i].checked) {
	            selected.push(obj[i].value);
	        }
	    }
	    if(selected.length === 0) {
	      	alert('請至少勾選一項！');
	      	e.preventDefault();
	    }
	};
	      
</script>

</body>
</html>
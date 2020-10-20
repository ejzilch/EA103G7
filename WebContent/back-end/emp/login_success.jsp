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
<title>登入成功</title>

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
	<h1>登入成功</h1><br>
	
	<span id="loginName">${empVO.emp_name}，您好！</span>
	
	<form style="margin: 0px;display: inline" method="post" action="<%=request.getContextPath()%>/back-end/emp/emp.do">
        <input type="hidden" name="action" value="logout"> 
        <label style="cursor:pointer" id="logout" >登出
        <input type="submit" name="logout" style="display:none"></label>  
    </form>
	
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
		<input type="submit" value="員工個資修改">
		<input type="hidden" name="emp_no" value="${empVO.emp_no}">
		<input type="hidden" name="action" value="Update_info">
	</FORM>
	
	<table>
		<tr><th>功能列表</th></tr>
		<tr><td><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp">員工管理</a></td></tr>
		<tr><td><a href="">會員管理</a></td></tr>
		<tr><td><a href="">後檯即時通訊</a></td></tr>
		<tr><td><a href="">查看通知</a></td></tr>
		<tr><td><a href="">現場點餐</a></td></tr>
		<tr><td><a href="">現場劃位</a></td></tr>
		<tr><td><a href="">候位管理</a></td></tr>
		<tr><td><a href="">訂單結帳</a></td></tr>
		<tr><td><a href="">訂單派工</a></td></tr>
		<tr><td><a href="">出餐管理</a></td></tr>
		<tr><td><a href="">訂餐訂單處理</a></td></tr>
		<tr><td><a href="">訂餐管理</a></td></tr>
		<tr><td><a href="">訂單管理</a></td></tr>
		<tr><td><a href="">訂位管理</a></td></tr>
		<tr><td><a href="">紅利商品管理</a></td></tr>
		<tr><td><a href="">桌位管理</a></td></tr>
		<tr><td><a href="">用餐營業時段管理</a></td></tr>
		<tr><td><a href="">最新消息管理</a></td></tr>
		<tr><td><a href="">廣告管理</a></td></tr>
		<tr><td><a href="">菜單管理</a></td></tr>
		<tr><td><a href="">評價管理</a></td></tr>
		<tr><td><a href="">通知管理</a></td></tr>
		<tr><td><a href="">食材管理</a></td></tr>
		<tr><td><a href="">餐點組成管理</a></td></tr>
		<tr><td><a href="">食材消耗統計</a></td></tr>
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
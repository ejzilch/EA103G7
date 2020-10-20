<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<% 
	MemVO memVO = (MemVO) request.getAttribute("memVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料</title>

<style>
	
</style>

</head>
<body>
	
	
<!-- 	<h4><a href="select_page.jsp">回主頁</a></h4> -->
	<h3>會員資料</h3>
	
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<FORM METHOD="post" ACTION="mem.do" name="form1">
	<table>
		<tr>
			<td>會員編號:</td>
			<td>${memVO.mem_no}</td>
		</tr>
		<tr>
			<td>會員姓名:</td>
			<td>${memVO.mem_name}</td>
		</tr>
		<tr>
			<td>帳號:</td>
			<td>${memVO.mem_act}</td>
		</tr>
		<tr>
			<td>性別:</td>
			<td>${memVO.mem_gen}</td>
		</tr>
		<tr>
			<td>生日:</td>
			<td>${memVO.mem_bir}</td>
		</tr>
		<tr>
			<td>手機:</td>
			<td>${memVO.mem_tel}</td>
		</tr>
		<tr>
			<td>地址:</td>
			<td>${memVO.mem_adrs}</td>
		</tr>
		<tr>
			<td>e-mail:</td>
			<td>${memVO.mem_mail}</td>
		</tr>
		<tr>
			<td>紅利點數:</td>
			<td>${(memVO.mem_bns == null) ? 0 : memVO.mem_bns}</td>
		</tr>
		<tr>
			<td>是否可訂餐:</td>
			<td>${(memVO.mem_od_m == 0) ? "不可" : "可"}</td>
		</tr>
		<tr>
			<td>是否可訂位:</td>
			<td>${(memVO.mem_od_r == 0) ? "不可" : "可"}</td>
		</tr>
		<tr>
			<td>是否可評價:</td>
			<td>${(memVO.mem_review == 0) ? "不可" : "可"}</td>
		</tr>
		<tr>
			<td>是否可檢舉:</td>
			<td>${(memVO.mem_repo == 0) ? "不可" : "可"}</td>
		</tr>
	</table>
		
		<input type="submit" value="個資修改">
		<input type="hidden" name="mem_no" value="${memVO.mem_no}">
		<input type="hidden" name="action" value="Update_info">
	
	</FORM>
	

	
</body>
</html>
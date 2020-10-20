<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="com.mem.model.*"%>
    
<% 
	MemVO memVO2 = (MemVO) session.getAttribute("memVO2");
%>

<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<h1>登入成功</h1><br>
	<FORM METHOD="post" ACTION="mem.do" name="form1">
		<input type="submit" value="個資查詢">
		<input type="hidden" name="mem_no" value="${memVO2.mem_no}">
		<input type="hidden" name="action" value="check_info">
	</FORM>
	
	<FORM METHOD="post" ACTION="mem.do" name="form1">
		<input type="submit" value="個資修改">
		<input type="hidden" name="mem_no" value="${memVO2.mem_no}">
		<input type="hidden" name="action" value="Update_info">
	</FORM>
		
	<FORM METHOD="post" ACTION="mem.do" name="form1">
		<input type="submit" value="登出">
		<input type="hidden" name="action" value="logout">
	</FORM>
	
</body>
</html>
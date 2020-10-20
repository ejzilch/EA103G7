<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>員工登入</title>

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
		<table border=1>
				<tr>
					<td colspan=2 align=center>
						<h4>員工登入</h4>
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>員工編號:</b>
					</td>
					<td>
						<p>
							<input type=text name="account" value="" size=15 required>
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>密碼:</b>
					</td>
					<td>
						<p>
							<input type=password name="password" value="" size=15 required>
					</td>
				</tr>

				<tr>
					<td colspan=2 align=center>
						
						<input type=submit value="登入">
						<input type="hidden" name="action" value="login">
						
					</td>
				</tr>
			</table>
		</FORM>
		</div>
		
		<jsp:include page="/back-end/siderbar/siderbar.jsp" />
		
</body>
</html>
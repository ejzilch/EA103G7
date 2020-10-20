<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.seat_obj.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改桌位物件</title>
<style type="text/css">
.div_img {
	height: 30px;
	width: 30px;
}

#preview, img {
	height: 170px;
	width: 170px;
}
</style>
</head>
<body>
<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<form action="<%=request.getContextPath()%>/seat/Seat_ObjServlet.do" method=post enctype="multipart/form-data">
		<label>桌位物件編號：${seatObjVO.seat_obj_no}</label>
		<div class="div_img">
			<input type="file" id="myFile" name="seat_obj" />
			<br>
		</div>
		<div id="preview">
			<img src="<%=request.getContextPath()%>/seat/Seat_ObjServlet.do?seat_obj_no=${seatObjVO.seat_obj_no}" />
		</div>
		<div class="set_people">
			設定桌位人數：
			<input class="cut" name="" type="button" value="-" disabled /> 
			<input id="seat_people" class="seat_people"	name="seat_people" type="text" value="${seatObjVO.seat_people}" readonly="readonly"
					style="width: 30px; text-align: center" /> 
			<input class="add" name="" type="button" value="+" disabled />
		</div>
		<div class="select_div">
			<jsp:useBean id="map" class="java.util.HashMap"/>
			<c:set target="${map}" property="0" value="座位"/>
			<c:set target="${map}" property="1" value="障礙物"/>
			<c:set target="${map}" property="2" value="背景圖"/>
			物件用途：
			<select id="seat_use" name="seat_use">
				<c:forEach  var="item" items="${map}">
				  <option class="seat_use" value="${item.key}" ${item.key eq seatObjVO.seat_use ? "selected" : ""}>${item.value}</option>
				</c:forEach>
			</select>
		</div>
		<input type="hidden" name="seat_obj_no" value="${seatObjVO.seat_obj_no}"> 
		<input type="hidden" name="action" value="one_obj_update"> <input type="SUBMIT" name="submit"
				value="送出修改" />
		<input type="button" value="回桌位物件設定" onclick="location.href='<%=request.getContextPath()%>/back-end/seat/seat_obj/setSeatObj.jsp'">
</form>
</body>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/back-end/js/jquery-ui-1.12.1.js"></script>
<script src="<%=request.getContextPath()%>/back-end/js/setSeatObj.js"></script>
<script src="<%=request.getContextPath()%>/back-end/js/updateSeatObjUpload.js"></script>
</html>
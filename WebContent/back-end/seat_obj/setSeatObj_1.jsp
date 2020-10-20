<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.seat_obj.model.*"%>
<%
	SeatObjService seatObjSvc = new SeatObjService();
	List<SeatObjVO> list = seatObjSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯桌位物件</title>
<link rel=stylesheet type="text/css" href="<%=request.getContextPath()%>/back-end/css/setSeatObj.css">
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
<table>
	<tr>
		<th>桌位物件編號</th>
		<th>桌位物件</th>
		<th>桌位人數</th>
		<th>用途</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<jsp:useBean id="map" class="java.util.HashMap"/>
		<c:set target="${map}" property="0" value="座位"/>
		<c:set target="${map}" property="1" value="障礙物"/>
		<c:set target="${map}" property="2" value="背景圖"/>
	<%@ include file="pages/page1.file"%>
		<c:forEach var="SeatObjVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<br>
			<tr>
			<td>
				${SeatObjVO.seat_obj_no}
			</td>
			<td>
				<c:if test="${not empty SeatObjVO.seat_obj}">
					<img src="<%=request.getContextPath()%>/seat/Seat_ObjServlet.do?seat_obj_no=${SeatObjVO.seat_obj_no}" />
				</c:if> 
				<c:if test="${empty SeatObjVO.seat_obj}">
					<img src="<%=request.getContextPath()%>/images/null.jpg" />
				</c:if>
			</td>
			<td>
				<input class="cut" name="" type="button" value="-" disabled /> 
				<input id="seat_people" class="seat_people" name="seat_people"
							type="text" value="${SeatObjVO.seat_people}" readonly="readonly" style="width: 30px; text-align: center" /> 
				<input class="add" name="" type="button" value="+" disabled />
			</td>
			<td>
				<c:forEach  var="item" items="${map}">
					<c:if test="${item.key eq SeatObjVO.seat_use}">
						<c:if test="${item.key eq SeatObjVO.seat_use}">
							${item.value}
						</c:if>
					</c:if>
				</c:forEach>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/seat/Seat_ObjServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="修改">
					<input type="hidden" name="action" value="go_update">
					<input type="hidden" name="seat_obj_no" value="${SeatObjVO.seat_obj_no}">
				</FORM>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/seat/Seat_ObjServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="刪除">
					<input type="hidden" name="seat_obj_no" value="${SeatObjVO.seat_obj_no}">
					<input type="hidden" name="action" value="delete_use_update">
					<input type="hidden" id="Page" name="Page" value="@ViewBag.Page" />
				</FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file"%>
<input type="button" value="新增桌位物件" onclick="location.href='<%=request.getContextPath()%>/back-end/seat_obj/addSeatObj.jsp'">
<input type="button" value="回桌位設定" onclick="location.href='<%=request.getContextPath()%>/back-end/seat/editSeat.jsp'">

<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/back-end/js/jquery-ui-1.12.1.js"></script>
</body>
</html>
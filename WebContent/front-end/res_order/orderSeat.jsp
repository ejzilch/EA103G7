<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.time_peri.model.*"%>
<%@ page import="com.seat.model.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%
	session.setAttribute("insert", "insert");
%>
<!DOCTYPE html>
<html>
<head>
<title>Order Seat</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/orderSeat.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
</head>

<body class="body">

<%
	Calendar now = Calendar.getInstance();
	request.setAttribute("now", now.get(Calendar.HOUR_OF_DAY));
	out.print("<h2>" + "現在時間==> ： " + now.get(Calendar.HOUR_OF_DAY) + "</h2>");
%>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<jsp:useBean id="seatSvc" scope="page" class="com.seat.model.SeatService" />
<%
	List<SeatVO> list = seatSvc.getAll();
	TreeSet<Integer> ts = new TreeSet<Integer>();
	for (int i = 0; i < list.size(); i++) {
		ts.add(list.get(i).getSeat_f());
	}
	pageContext.setAttribute("ts", ts);
%>
	<form method="post" action="<%=request.getContextPath()%>/res_order/ResOrderServlet.do">
		<div class="select_div">
			<select id="floor_list" name="floor_list">
				<c:forEach var="seat_f" items="${ts}">
					<option class="lt" value="${seat_f}">${seat_f}樓座位區</option>
				</c:forEach>
			</select>
		</div>
		<div class="select_div1">
			<label> 預定日期: 
				<input name="res_date" id="res_date" type="text" style="width: 7em" value="--請選擇日期--" onfocus="this.blur()"> 
				<br>
			</label> 
			<label class="labelOne"> 選擇時段: 
				<jsp:useBean id="timePeriSvc" scope="page" class="com.time_peri.model.TimePeriService" /> 
				<select id="time_peri_no" name="time_peri_no" style="text-align: center; text-align-last: center;">
						<option class="lt" value="-1">--請先選擇日期--</option>
				</select> 
				<input type="hidden" name="mem_no" value="MEM0010"> <input type="hidden" name="emp_no" value="EMP0001">
			</label>
			<br> 
			<label class="labelTwo"> 用餐人數: 
				<input id="people" type="number" min="1" max="60" name="people" placeholder="請輸入用餐人數">人
			</label>
			<br>
			<input type="hidden" name="action" value="order_seat">
			<button id="orderSeat" name="action" value="order_seat" onclick='return false;'>訂位</button>
		</div>
		<div id="container" class="ui-widget-header container" data-role="drag-drop-container">
			<c:forEach var="seatVO" items="${seatSvc.all}">
				<c:if test="${seatVO.seat_f == 1 }">
					<div class="drag ui-draggable" style="position: absolute; left: ${seatVO.seat_x}px; top: ${seatVO.seat_y}px;" id="drag">
						<label> 
							<input type="checkbox" class="myCheckbox" id="myCheckbox" name="seat_checked" value="${seatVO.seat_no}"> 
							<img src="<%=request.getContextPath()%>/seat/Seat_ObjServlet.do?seat_obj_no=${seatVO.seat_obj_no}">
						</label> 
						<label class="seatLabel">
							<input type="text" class="seatName" name="seatName" disabled value="${seatVO.seat_name}">
						</label>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</form>
<script src="<%=request.getContextPath()%>/front-end/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script src="<%=request.getContextPath()%>/front-end/js/sweetalert.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/js/orderSeat.js"></script>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.flushBuffer();
%>
</body>
</html>
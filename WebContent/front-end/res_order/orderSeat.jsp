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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/css/orderSeat.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/aos.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/jquery.timepicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/flaticon.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/icomoon.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">

</head>

<body class="body">
<jsp:include page="/front-end/head.jsp"></jsp:include>
<%
// 	Calendar now = Calendar.getInstance();
// 	request.setAttribute("now", now.get(Calendar.HOUR_OF_DAY));
// 	out.print("<h2>" + "現在時間==> ： " + now.get(Calendar.HOUR_OF_DAY) + "</h2>");
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
		<div class="container">
			<select id="floor_list" name="floor_list">
				<c:forEach var="seat_f" items="${ts}">
					<option class="lt" value="${seat_f}">${seat_f}樓座位區</option>
				</c:forEach>
			</select>
				預定日期: 
				<input name="res_date" id="res_date" type="text" value="--請選擇日期--" onfocus="this.blur()"> 
			<label class="labelOne"> 選擇時段: 
				<jsp:useBean id="timePeriSvc" scope="page" class="com.time_peri.model.TimePeriService" /> 
				<select id="time_peri_no" name="time_peri_no" >
						<option class="lt" value="-1">--請先選擇日期--</option>
				</select> 
				<input type="hidden" name="mem_no" value="MEM0010"> <input type="hidden" name="emp_no" value="EMP0001">
			</label>
			<label class="labelTwo"> 用餐人數: 
				<input id="people" type="number" min="1" max="60" name="people" placeholder="請輸入用餐人數">人
			</label>
			<input type="hidden" name="action" value="order_seat">
			<button id="orderSeat" name="action" value="order_seat" onclick='return false;'>訂位</button>
		</div>
		<div id="container" class="container">
			<c:forEach var="seatVO" items="${seatSvc.all}">
				<c:if test="${seatVO.seat_f == 1 }">
					<div class="drag" style="position: absolute; left: ${seatVO.seat_x}px; top: ${seatVO.seat_y}px;" id="drag">
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
	<jsp:include page="/front-end/footer.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/front-end/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>


        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
                <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
                <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg></div>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery.easing.1.3.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery.waypoints.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery.stellar.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery.magnific-popup.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/aos.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery.animateNumber.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/bootstrap-datepicker.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/jquery.timepicker.min.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/google-map.js"></script>
        <script src="<%=request.getContextPath()%>/front-end/js/main.js"></script>
        <script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script src="<%=request.getContextPath()%>/front-end/js/sweetalert.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/js/orderSeat.js"></script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.bonus_order_detail.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  Bonus_Order_DetailVO bonus_order_detailVO = (Bonus_Order_DetailVO) request.getAttribute("bonus_order_detailVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>���Q�ӫ~�q��s����� - listOneBonus_Order_Detail.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���Q�ӫ~�q��s����� - listOneBonus_Order_Detail.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���Q�ӫ~�q��s��</th>
		<th>���Q�ӫ~�s��</th>
		<th>�ƶq</th>
	</tr>
	<tr>
		<td><%=bonus_order_detailVO.getBo_no()%></td>
		<td><%=bonus_order_detailVO.getBns_no()%></td>
		<td><%=bonus_order_detailVO.getQuantity()%></td>
	</tr>
</table>

</body>
</html>
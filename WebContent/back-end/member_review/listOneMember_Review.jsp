<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.member_review.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  Member_ReviewVO member_reviewVO = (Member_ReviewVO) request.getAttribute("member_reviewVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>������� - listOneMember_Review.jsp</title>

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
		 <h3>������� - listOneMember_Review.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�����s��</th>
		<th>�q�\�s��</th>
		<th>�������e</th>
		<th>�������</th>
		<th>�������A</th>
		<th>�R�����A</th>
	</tr>
	<tr>
		<td><%=member_reviewVO.getReview_no()%></td>
		<td><%=member_reviewVO.getMeal_order_no()%></td>
		<td><%=member_reviewVO.getMem_review_con()%></td>
		<td><%=member_reviewVO.getReview_date()%></td>
		<td><%=member_reviewVO.getReview_sts()%></td>
		<td><%=member_reviewVO.getReview_del()%></td>
	</tr>
</table>

</body>
</html>
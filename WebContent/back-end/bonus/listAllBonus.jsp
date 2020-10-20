<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bonus.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    BonusService bonusSvc = new BonusService();
    List<BonusVO> list = bonusSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��������e - listAllMember_Review.jsp</title>

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
	width: 800px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���Q�ӫ~���e - listAllBonus.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>���Q�ӫ~�s��</th>
		<th>���Q�ӫ~�W��</th>
		<th>���Q�ӫ~����</th>
		<th>�w�s�q</th>
		<th>���Ĥ��</th>
		<th>���Q�ӫ~���A</th>
		<th>���Q�ӫ~�Ϥ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="bonusVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${bonusVO.bns_no}</td>
			<td>${bonusVO.bns_name}</td>
			<td>${bonusVO.bns_price}</td>
			<td>${bonusVO.bns_stks}</td>
			<td>${bonusVO.bns_date}</td>
			<td>${bonusVO.bns_sts}</td> 
			<td><img src="<%=request.getContextPath() %>/back-end/bonus/forwarded?bonus_img=${bonusVO.bns_no}"></td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/bonus/forwarded" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="bns_no"  value="${bonusVO.bns_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/bonus/forwarded" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="bns_no"  value="${bonusVO.bns_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Emp: Home</title>

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
	<table id="table-1">
	   <tr><td><h3>Emp: Home</h3></td></tr>
	</table>
				  
	<h3>��Ƭd��:</h3>
	
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
		    <c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<ul>
	  <li><a href='listAllEmp.jsp'>List</a> all Emps.  <br><br></li>
	  
	  
	  <li>
	    <FORM METHOD="post" ACTION="emp.do" >
	        <b>��J���u�s�� (�pEMP0001):</b>
	        <input type="text" name="emp_no">
	        <input type="hidden" name="action" value="getOne_For_Display">
	        <input type="submit" value="�e�X">
	    </FORM>
	  </li>
	
	  <jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
	   
	  <li>
	     <FORM METHOD="post" ACTION="emp.do" >
	       <b>��ܭ��u�s��:</b>
	       <select size="1" name="emp_no">
	         <c:forEach var="empVO" items="${empSvc.all}" > 
	          <option value="${empVO.emp_no}">${empVO.emp_no}
	         </c:forEach>   
	       </select>
	       <input type="hidden" name="action" value="getOne_For_Display">
	       <input type="submit" value="�e�X">
	    </FORM>
	  </li>
	  
	  <li>
	     <FORM METHOD="post" ACTION="emp.do" >
	       <b>��ܭ��u�m�W:</b>
	       <select size="1" name="emp_no">
	         <c:forEach var="empVO" items="${empSvc.all}" > 
	          <option value="${empVO.emp_no}">${empVO.emp_name}
	         </c:forEach>   
	       </select>
	       <input type="hidden" name="action" value="getOne_For_Display">
	       <input type="submit" value="�e�X">
	     </FORM>
	  </li>
	</ul>

	<h3>���u�޲z</h3>
	
	<ul>
	  <li><a href='addEmp.jsp'>Add</a> a new Emp.</li>
	</ul>
	</div>
	
	<jsp:include page="/back-end/siderbar/siderbar.jsp" />

</body>
</html>
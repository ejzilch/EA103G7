<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>

<html>
<head>
<title>�ѰO�K�X</title>

<style>

#container{
  padding-top: 50px;
  padding-bottom: 50px;
  margin:0 auto;
  width: 600px;
}

</style>

</head>
<body>
	
	<%@ include file="/front-end/headfinish.jsp"%>
	
	<div id="container">
	<h3 style="text-align:center">�ѰO�K�X</h3>
	
	<form method="post" action="<%=request.getContextPath()%>/front-end/mem/mem.do">
		<span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;�п�Jemail:</span>
		<input type="email" name="mem_mail">
		<p><p>
		<input type="submit" value="�e�X" style="margin-left:275px">
		<input type="hidden" name="action" value="forget_psw">
	</form>
	
	<span style="color: red;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;�����U�e�X�N�|�H�X�{�ɱK�X�A�Шϥ��{�ɱK�X�n�J</span>
	</div>
	
	<jsp:include page="/front-end/front/footer.jsp" />
	
</body>
</html>
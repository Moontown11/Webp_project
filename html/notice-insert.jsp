<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>�Խñ� ����</title>
    <meta charset="utf-8" />
    <meta name="view" content="width=device-width" />
    <!--  <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="..\css\menu.css" />
    <link rel="stylesheet" href="..\css\unite.css" />
    <link rel="stylesheet" href="..\css\notice.css" />
  </head>
<body>
	<%
	String m_id = (String)session.getAttribute("ID");
	//������ ���� ���
	if(m_id == null){
	%>
		�α��� �� �ۼ��ϼ���.<br>
		<a href="Login.html">�α���</a>
	<%
	}else{
	%>
	
	<center>
	<h2> �� �� ��</h2>
	<form action = "notice-insert-db.jsp" method="post">
	<table border = "0">
		<tr>
			<td>�� �� �� : </td>
			<td><input type = "text" name = "title" size = "50"></td>
		</tr>
		<tr>
			<td valign="top">�� �� �� : </td>
			<td><textarea name="content" cols="65" rows="4"></textarea></td>
		</tr>
		
	</table><br><br>
	
	<input type="submit" value="����ϱ�">
	<input type="reset" value="�ٽþ���">
	
	</form>
	
	<a href="Notice.jsp">�Խñ� ��� ����</a><br>
	</center>
	<%
	}
	%>
</body>
</html>
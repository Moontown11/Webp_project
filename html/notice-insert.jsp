<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>게시글 쓰기</title>
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
	//세션이 없는 경우
	if(m_id == null){
	%>
		로그인 후 작성하세요.<br>
		<a href="Login.html">로그인</a>
	<%
	}else{
	%>
	
	<center>
	<h2> 게 시 판</h2>
	<form action = "notice-insert-db.jsp" method="post">
	<table border = "0">
		<tr>
			<td>글 제 목 : </td>
			<td><input type = "text" name = "title" size = "50"></td>
		</tr>
		<tr>
			<td valign="top">글 내 용 : </td>
			<td><textarea name="content" cols="65" rows="4"></textarea></td>
		</tr>
		
	</table><br><br>
	
	<input type="submit" value="등록하기">
	<input type="reset" value="다시쓰기">
	
	</form>
	
	<a href="Notice.jsp">게시글 목록 보기</a><br>
	</center>
	<%
	}
	%>
</body>
</html>
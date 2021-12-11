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
	%>
		<script>
		alert("로그인 후 작성하세요!");
		document.location.href = "Notice.jsp";
		</script>
	<%
	}else{
	%>
	
	<center>
	<h2> 게 시 판 </h2><br><br>
	<form action = "notice-insert-db.jsp" method="post">
	<table class="insert_form">
	글 제목 : <input type="text" name="title" size="100" style="height:35px;" required><br><br>
	</div><textarea name="content" cols="150" rows="35" required></textarea><br><br>
	
	<div id="btn_group">
		<button id="notice_btn1" type="submit"> 등록하기 </button>&nbsp;&nbsp;&nbsp;
		<button id="notice_btn2" type="reset"> 다시쓰기 </button><br><br><br>
	</div>
	</table>
	</form>
	
	<button id="back_btn" onclick="location.href='Notice.jsp'">게시글 목록 보기</button><br>
	</center>
	<%
	}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("EUC-KR"); %>
<html>
<body>
	<%
	String m_id = (String)session.getAttribute("ID");
	//세션이 없는 경우
	if(m_id == null){
	%>
		<script>
		alert("로그인 후 작성하세요!");
		document.location.href = "Notice.jsp";
		</script>
	<%
	}else{ //세션 있으면
	%>

	<%
		int id;
		String title="", content="";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		id = Integer.parseInt(request.getParameter("id"));
	    PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		String name= null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
            conn = DriverManager.getConnection(url, "root", "0000");
            stmt = conn.createStatement();
            
   	     	rs = stmt.executeQuery("select * from notice where id = " + id );
		  	     	
	  	    String sql2 = "select name from member where id = ?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1,m_id);
			rs2 = pstmt2.executeQuery();
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다.:" + e.getMessage());
		}
			
		if(rs2.next()){
			name = rs2.getString("name"); //현재 세션 멤버 이름
		}	
		while(rs.next()){
			 String author = rs.getString("name"); //게시글에 저장된 작성자
			if(!author.equals(name))
			{
			%>
		<center><h2>작성자가 다릅니다.</h2>
		<a href="notice-read.jsp?id=<%=id %>">뒤로</a>
		</center>
		<%
			}
			else {
		%>
		<center><h2>게시글 수정</h2><br><br>
		<form action="notice-modify-db.jsp" method="post">
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
		<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
		
		<input type="submit" value="등록하기">
		<input type="reset" value="다시쓰기">		
		</form>

		<a href="notice-read.jsp?id=<%=request.getParameter("id") %>">취소</a>
		</center>
		
		<%
					}
						}
		%>
		
	<%
	}
	%>
</body>
</html>
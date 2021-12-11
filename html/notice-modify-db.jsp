<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
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
		title = request.getParameter("title");
		content = request.getParameter("content");
		
			try{
				Class.forName("com.mysql.jdbc.Driver");
	            String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
	            conn = DriverManager.getConnection(url, "root", "0000");
	            stmt = conn.createStatement();
	            String sql_update = "update notice set title= '"+ title +"', content='" + content + "' where id = " + id;
	            	stmt.executeUpdate(sql_update);
			}
			catch(Exception e){
				out.println("DB 연동 오류입니다.:" + e.getMessage());
			}
%>

		<script>
		alert("게시글이 수정되었습니다!");
		document.location.href = "Notice.jsp";
		</script>
	
	<%
	}
	%>
</body>
</html>
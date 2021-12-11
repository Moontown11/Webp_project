<%@ page language="java" contentType="text/html; charset=EUC-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("EUC-kr"); %>
<html>
  <body>
    <%
	String m_id = (String)session.getAttribute("ID");
	//세션이 없는 경우
	if(m_id == null){
	%>
		로그인 후 작성하세요.<br>
		<a href="Login.html">로그인</a>
	<%
	}else{ //세션 있으면
	%>
	
	<%
    int id; //게시글 id임
    String sql,sql1;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    id = Integer.parseInt(request.getParameter("id"));
   
    PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	String name= null;
	 
    try { 
         Class.forName("com.mysql.jdbc.Driver");
	     String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
	     conn = DriverManager.getConnection(url, "root", "0000");
	     stmt = conn.createStatement();
	     
	     sql = "select * from notice where id = " + id;
	     rs = stmt.executeQuery(sql);
	     
		 String sql2 = "select name from member where id = ?";
		 pstmt2 = conn.prepareStatement(sql2);
		 pstmt2.setString(1,m_id);
		 rs2 = pstmt2.executeQuery();
		 
		 
       }
       catch(Exception e) {
           out.println("DB 연동 오류입니다. : " + e.getMessage());
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
    <a href="notice-read.jsp?id=<%= id %>">뒤로</a>
    </center>
    
    <%
    	 }
    	 else
    	 {
    		 sql1="delete from notice where id = " + id;
    		 try{
    			 stmt.executeUpdate(sql1);
    		 }
    		 catch(Exception e){
    			 out.println("DB 연동 오류입니다.:" + e.getMessage());
    		 }
    %>
    	<script>
    	alert("게시글 삭제 완료!");
    	document.location.href = "Notice.jsp";
    	</script>
    <%
    		break;
    		}
    	}
    %>
    
	<%
	}
	%>
  </body>
</html>
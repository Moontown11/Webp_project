<%@ page language="java" contentType="text/html; charset=EUC-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("EUC-kr"); %>
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
		로그인 후 대출하세요.<br>
		<a href="login.html">로그인</a>
	<%
	}else{
	%>

    <%    
	    int temp = 0,cnt;
		int new_id = 0;
	    String name = null;
	    String date, title, content;
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    PreparedStatement pstmt2 = null;
	    ResultSet rs2 = null;
	    String sql_update;
	   
	    
	    try { 
	         Class.forName("com.mysql.cj.jdbc.Driver");
		     String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		     conn = DriverManager.getConnection(url, "root", "0000");
		     
		     stmt = conn.createStatement();
			 String sql = "select max(id) as max_id, count(*) as cnt from notice";
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
	    	name = rs2.getString("name");
	    }
	    
	     while(rs.next()) {
		  	 cnt = Integer.parseInt(rs.getString("cnt"));
		   	 if(cnt != 0) 
		   		 new_id = Integer.parseInt(rs.getString("max_id"));
		 }
		     
		 new_id++;
		 title=request.getParameter("title");
		 content=request.getParameter("content");
		 
		 sql_update = "insert into notice values(?, ?, NOW(), ?, ?)";
		 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(sql_update);
		     pstmt.setInt(1, new_id);
		     pstmt.setString(2, name);
		     pstmt.setString(3, title);
		     pstmt.setString(4, content);
			 pstmt.executeUpdate();
		 }
	     catch(Exception e) {
	           out.println("DB 연동 오류입니다. : " + e.getMessage());
	     }
    %>
    
    <center>
    <h2> 작성한 글이 등록되었습니다. </h2>
    <a href="Notice.jsp"> 게시글 목록 보기</a> 
    </center>

	<%
	}
	%>
  </body>
</html>
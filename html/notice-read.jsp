<%@ page language="java" contentType="text/html; charset=EUC-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <title>Notice</title>
    <meta charset="utf-8" />
    <meta name="view" content="width=device-width" />
    <!--  <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="..\css\menu.css" />
    <link rel="stylesheet" href="..\css\unite.css" />
    <link rel="stylesheet" href="..\css\notice.css" />
  </head>
  <body> 
     <center><h2> 게시글 내용 </h2></center>
     <center>
     <%
   	 int id =0;
	 String name = "", title = "", date = "", content = "";
         Connection conn = null;
	 Statement stmt = null;
	 ResultSet rs = null;
	     
         id = Integer.parseInt(request.getParameter("id"));

         try {
               Class.forName("com.mysql.jdbc.Driver");
               String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
               conn = DriverManager.getConnection(url, "root", "0000");
               stmt = conn.createStatement();
               String sql = "select * from notice where id = " + id;
               rs = stmt.executeQuery(sql);
         }
         catch(Exception e) {
               out.println("DB 연동 오류입니다. : " + e.getMessage());
         } 

         while(rs.next())  {
	       name = rs.getString("name");
	       title = rs.getString("title");
	       date = rs.getString("date");
	       content = rs.getString("content");
	 }
    %>     
    <table cellpadding="0" cellspacing="0" border="0">
      <tr>
          <td width="100">글 쓴 이 : </td>
	      <td><%= name %></td>
      </tr>
      <tr>
	      <td>작성일 : </td>
	      <td><%= date %></td>
      </tr>      
      <tr>
	      <td>글 제 목 : </td>
	      <td><%= title %></td>
      </tr>
      <tr>
	      <td>글 내 용 : </td>
	      <td><%= content %></td>
      </tr>
    </table><br><br>

    <a href="notice-modify.jsp?id=<%=id%>"> 게시글 수정</a>

    <a href="notice-delete.jsp?id=<%=id%>"> 게시글 삭제 </a>

    <a href="Notice.jsp"> 게시글 목록 보기 </a>
  </body>
</html>
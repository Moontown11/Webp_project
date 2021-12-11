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
    <link rel="stylesheet" href="..\css\notice-read.css" />
  </head>
  <body> 
     <%
      String m_id = (String)session.getAttribute("ID");
      String log;
      
        if(m_id == null){
          log="<a href=Login.html>로그인</a>";
      } else {
        log="<a href=logout.jsp>로그아웃</a>";
      }
      
      
    %>
     <nav id="main_menu">
      <div class="box" style="text-align: center">
        <a href="mainpage.jsp" class="maintext">FOOD COURT</a>
        <div class="menu-list">
          <ul>
            <li>
              <a href="..\html\Brand.jsp">Our Brand</a>
            </li>
            <li><a href="..\html\Menu.jsp">Menu</a></li>
            <li>
              <a href="..\html\Location.jsp">Location</a>
            </li>
            <li><a href="..\html\Notice.jsp">Notice</a></li>
            <li><a href="..\html\Crew.jsp">Crew</a></li>
            <li>
              <button id="loginbutton"><%=log%></button>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  
     <center>
        <div class="read-body">
            <center><h1>공지사항</h1></center>
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
          
          <div class="read-content">
             <table cellpadding="0" cellspacing="0" border="0">
               <tr>
                   <td width="100"><b>글 쓴 이 : </b></td>
                  <td><%= name %></td>
               </tr>
               <tr>
                  <td><b>작성일 : </b></td>
                  <td><%= date %></td>
               </tr>      
               <tr>
                  <td><b>글 제 목 : </b></td>
                  <td><%= title %></td>
               </tr>
               <tr>
                 <td> <b>글 내 용 : </b></td>
                  <td><%= content %></td>
               </tr>
             </table>
          </div>
          
          <div class="bot-buttons">
             <button><a href="notice-modify.jsp?id=<%=id%>"> 게시글 수정</a></button>
             <button><a href="notice-delete.jsp?id=<%=id%>"> 게시글 삭제 </a></button>
             <button><a href="Notice.jsp"> 게시글 목록 보기 </a></button>
          </div>
        </div>
   </center>    
  </body>
</html>
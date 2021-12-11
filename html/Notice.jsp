<%@ page language="java" contentType="text/html; charset=EUC-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
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

    <section>
      <!--for demo wrap-->
      <h1>공지사항</h1>
      <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
          <thead>
            <tr>
              <th>번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
            </tr>
          </thead>
        </table>
      </div>

     

      <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
          <tbody>
            <%
              int id;
              int rownum = 0;
              Connection conn = null;
              Statement stmt = null;
              String sql = null;
              ResultSet rs = null;
              
              try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
                conn = DriverManager.getConnection(url,"root","0000");
                stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                sql = "select * from notice order by id asc";
                rs = stmt.executeQuery(sql);
              }
              catch(Exception e){
            	  
                out.println("DB 연동 오류입니다.:" + e.getMessage());
              }
                rs.last();
                rownum=rs.getRow();
                rs.beforeFirst();
                
                while(rs.next())
                {
                  id = Integer.parseInt(rs.getString("id"));
            %>	
            <tr>
              <td><%= rownum %></td>
              <td>
                <a href=notice-read.jsp?id=<%= rs.getString("id") %> width="250">
                  <%= rs.getString("title") %></a></td>
              <td><%= rs.getString("name") %></td>
              <td><%= rs.getString("date") %></td>
            </tr>
            <% rownum--;} %>
          </tbody>
        </table>
        
		<%
			stmt.close();
			conn.close();
		%>
      </div>
    </section>
    <a href="notice-insert.jsp">게시글 쓰기</a>

    <script>
      $(window)
        .on("load resize ", function () {
          var scrollWidth =
            $(".tbl-content").width() - $(".tbl-content table").width();
          $(".tbl-header").css({ "padding-right": scrollWidth });
        })
        .resize();
    </script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Crew</title>
    <meta charset="UTF-8" />
    <meta name="view" content="width=device-width" />
    <!--  <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="..\css\menu.css" />
    <link rel="stylesheet" href="..\css\unite.css" />
    <link rel="stylesheet" href="..\css\member.css" />
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
    <div class="main-body">
      <div class="figure-box">
        <figure class="cardbody red">
          <figcaption>
            <h2>Dan <span>Parker</span></h2>
            <p>Some things don't need the thought people give them.</p>
          </figcaption>
          <img src="..\image\crew-man.jpg" alt="sample7" />
          <div class="position">CEO</div>
        </figure>
        <figure class="cardbody red">
          <figcaption>
            <h2>Ham <span>Smithson</span></h2>
            <p>Some things don't need the thought people give them.</p>
          </figcaption>
          <img src="..\image\crew-chef-one.jpg" alt="sample7" />
          <div class="position">Chef</div>
        </figure>
        <figure class="cardbody red">
          <figcaption>
            <h2>Taylor <span>Brock</span></h2>
            <p>Some things don't need the thought people give them.</p>
          </figcaption>
          <img src="..\image\crew-chef-two.jpg" alt="sample7" />
          <div class="position">Chef</div>
        </figure>
        <figure class="cardbody red">
          <figcaption>
            <h2>Sam <span>Smith</span></h2>
            <p>Some things don't need the thought people give them.</p>
          </figcaption>
          <img src="..\image\crew-italian.jpg" alt="sample7" />
          <div class="position">Chef</div>
        </figure>
      </div>
    </div>
  </body>
</html>

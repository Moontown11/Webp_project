<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Location</title>
    <meta charset="UTF-8" />
    <meta name="view" content="width=device-width" />
    <!--  <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="..\css\menu.css" />
    <link rel="stylesheet" href="..\css\unite.css" />
    <link rel="stylesheet" href="..\css\location.css" />
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
    <main>
      <div class="map-explanation customPink">
        <h3 class="map-topic">찾아오시는 길</h3>        
        <div class="map-greybox">
          <h5>30 Pildong-ro 1-gil, Jangchung-dong, Jung-gu, Seoul</h5>
          <div class="map">
            <img class="slideImage" src="..\image\map.PNG" />
          </div>
        </div>
      </div>
      <div class="bottom customPink">
        <div class="bottom-form">
          <form class="form">
            <h2 class="form-topic">INFO</h2>
            <b><p type="Email: donggukElephant@gmail.com"></p></b>
            <b><p type="Phone: 010-1234-5678"></p></b>
          </form>
        </div>
        <div class="bottom-form">
          <form class="form">
            <h2 class="form-topic">CONTACT US</h2>
            <p type="Name:"><input placeholder="Write your name here.."></input></p>
            <p type="Email:"><input placeholder="Let us know how to contact you back.."></input></p>
            <p type="Message:"><input placeholder="What would you like to tell us.."></input></p>
            <button class="form-send"  onclick="btn()">Send Message</button>
          </form>
        </div>
      </div>
    </main>
    <script>
      function btn(){ alert('전송이 완료되었습니다'); }
    </script>
  </body>
</html>

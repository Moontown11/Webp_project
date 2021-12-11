<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Our Brand</title>
    <meta charset="UTF-8" />
    <meta name="view" content="width=device-width" />
    <!--  <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="..\css\menu.css" />
    <link rel="stylesheet" href="..\css\brand.css" />
    <link rel="stylesheet" href="..\css\unite.css" />
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
      <div class="brand-main customPink">
        <div class="brand-title">
          <p class="semi-title">국내 최고의 ^^전문점</p>
        </div>
        <div class="brand-imgtxt">
          <img class="slideImage" src="..\image\restaurant-tables.jpg" />
          <div>
            <p>
              전국 매장에서 매일 고객들에게 제품과 서비스를 제공하고 있는 저희
              FoodCourt는 전세계인들이 사랑하는 퀵 서비스 레스토랑(QSR, Quick
              Service Restaurant)이자 푸드서비스 기업으로, 고객에게 더 나은
              경험을 제공함으로써 '고객이 가장 좋아하는 장소이자 음식을 즐기는
              최고의 방법(Our Customer’s Favorite Place and Way to Eat)'이 되기
              위해 노력하고 있습니다. <br /><br />앞으로 저희는 좋은 품질의
              제품을 합리적인 가격과 최상의 서비스 제공을 통해 고객이 가장
              선호하는 장소로 거듭나기 위해 지속적으로 노력할 것입니다.
            </p>
          </div>
        </div>
      </div>
    </main>

    <footer></footer>
  </body>
</html>

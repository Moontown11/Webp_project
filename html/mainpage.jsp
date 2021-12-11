<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Restaurant</title>
    <meta charset="UTF-8" />
    <meta name="view" content="width=device-width" />
    <!--  <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="..\css\menu.css" />
    <link rel="stylesheet" href="..\css\slideshow.css" />
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
      <div class="notice">
        <span>신메뉴 출시!!</span>
      </div>

      <div class="outer-box">
        <div class="slideshow-container">
          <a class="prev" onclick="moveSlide(-1)">&#10094;</a>

          <div class="slideimage-box">
            <div class="slide fade">
              <img class="slideImage" src="..\image\restaurant-tables.jpg" />
            </div>

            <div class="slide fade">
              <img class="slideImage" src="..\image\restaurant-make.jpg" />
            </div>

            <div class="slide fade">
              <img class="slideImage" src="..\image\restaurant-foods.jpg" />
            </div>
          </div>

          <a class="next" onclick="moveSlide(1)">&#10095;</a>
        </div>
        <div style="text-align: center">
          <span class="dot" onclick="pickSlide(1)"></span>
          <span class="dot" onclick="pickSlide(2)"></span>
          <span class="dot" onclick="pickSlide(3)"></span>
        </div>
      </div>
    </main>

    <script>
      var slideIdx = 1;
      handleSlide(slideIdx);

      function moveSlide(n) {
        handleSlide((slideIdx += n));
      }

      function pickSlide(n) {
        handleSlide((slideIdx = n));
      }

      function handleSlide(n) {
        var i;
        var slides = document.getElementsByClassName("slide");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
          slideIdx = 1;
        }
        if (n < 1) {
          slideIdx = slides.length;
        }
        for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIdx - 1].style.display = "block";
        dots[slideIdx - 1].className += " active";
      }
    </script>
  </body>
</html>

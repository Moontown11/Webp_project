<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Menu</title>
    <meta charset="utf-8" />
    <meta name="view" content="width=device-width" />
    <!--  <script src="https://kit.fontawesome.com/8eb5905426.js" crossorigin="anonymous"></script>-->
    <link rel="stylesheet" href="..\css\menu.css" />
    <link rel="stylesheet" href="..\css\card.css" type="text/css" media="all" />
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

    <div class="home">
      <div class="site-wrapper">
        <section class="tabs-wrapper">
          <div class="tabs-container">
            <div class="tabs-block">
              <div class="tabs" id="tabs-section">
                <ul class="tab-head">
                  <li>
                    <a href="#tab-1" class="tab-link active">
                      <span class="tab-label">메인 메뉴</span></a
                    >
                  </li>
                  <li>
                    <a href="#tab-2" class="tab-link active">
                      <span class="tab-label">디저트</span></a
                    >
                  </li>
                  <li>
                    <a href="#tab-3" class="tab-link">
                      <span class="tab-label">음료</span></a
                    >
                  </li>
                </ul>

                <section
                  id="tab-1"
                  class="tab-body entry-content active active-content"
                >
                  <div class="card-container">
                    <div class="card">
                      <img src="..\image\menu-sirloin-steak.jpg" alt="Avatar" />
                      <div class="card-explanation">
                        <h4><b>Sirloin Steak</b></h4>
                        <p>
                          진한 브라운소스를 곁들인 그릴에 구은 채끝등심 스테이크
                        </p>
                      </div>
                    </div>
                    <div class="card">
                      <img
                        src="..\image\menu-Tenderloin-Steak.jpg"
                        alt="Avatar"
                      />
                      <div class="card-explanation">
                        <h4><b>Tenderoin Steak</b></h4>
                        <p>레드와인 소스가 곁들여진 부드러운 안심 스테이크</p>
                      </div>
                    </div>
                    <div class="card">
                      <img
                        src="..\image\menu-Creamy-Mushroom.jpg"
                        alt="Avatar"
                      />
                      <div class="card-explanation">
                        <h4><b>Mushroom Cream Spaghetti</b></h4>
                        <p>버섯이 들어간 담백한 크림파스타</p>
                      </div>
                    </div>
                    <div class="card">
                      <img src="..\image\menu-mare-cream.jpg" alt="Avatar" />
                      <div class="card-explanation">
                        <h4><b>Mare Cream Spaghetti</b></h4>
                        <p>신선한 해산물로 맛을 낸 크림파스타</p>
                      </div>
                    </div>
                    <div class="card">
                      <img src="..\image\menu-Caesar-Salad.jpg" alt="Avatar" />
                      <div class="card-explanation">
                        <h4><b>Caesar Salad</b></h4>
                        <p>
                          신선한 야채와 베이컨 크루통, 파마산 치즈가 어울어진
                          샐러드
                        </p>
                      </div>
                    </div>
                    <div class="card">
                      <img
                        src="..\image\menu-antipasto-salad.jpg"
                        alt="Avatar"
                      />
                      <div class="card-explanation">
                        <h4><b>Antipasto di Salmone</b></h4>
                        <p>
                          신선한 훈제연어와 상큼한 야채가 담백함을 살려낸 샐러드
                        </p>
                      </div>
                    </div>
                  </div>
                </section>

                <section id="tab-2" class="tab-body entry-content">
                  <div class="card-container">
                    <div class="card">
                      <img
                        src="..\image\dessert-chocolate-cake.jpg"
                        alt="Avatar"
                      />
                      <div class="card-explanation">
                        <h4><b>Chocolate Devil's Cake</b></h4>
                        <p>
                          호두를 넣은 브라우니를 탑처럼 쌓아 올려 다크초콜릿과
                          달콤하게 어우러진 진한 초콜릿 케이크.
                        </p>
                      </div>
                    </div>
                    <div class="card">
                      <img
                        src="..\image\dessert-crepe-cheese.jpg"
                        alt="Avatar"
                      />
                      <div class="card-explanation">
                        <h4><b>Crepe Cheese Cake</b></h4>
                        <p>
                          부드러운 카스텔라와 에멘탈 치즈, 크림치즈로 만든
                          케이크를 얇게 구운 크레이프로 감싸 만든 케이크
                        </p>
                      </div>
                    </div>
                  </div>
                </section>

                <section id="tab-3" class="tab-body entry-content">
                  <div class="card-container">
                    <div class="card">
                      <img src="..\image\drink-one.jpg" alt="Avatar" />
                      <div class="card-explanation">
                        <h4><b>몽그라스 아우라 까베르네 소비뇽</b></h4>
                        <p>
                          븕은 과일향과 은은한 바닐라, 초콜렛 향이 잘 어우러지는
                          와인. 부드러운 질감을 가진 와인.
                        </p>
                      </div>
                    </div>
                    <div class="card">
                      <img src="..\image\drink-two.jpg" alt="Avatar" />
                      <div class="card-explanation">
                        <h4><b>루이막스 부르고뉴 피노누아</b></h4>
                        <p>
                          라임과 민트향이 곁들여진 체리, 붉은 과실의 아로마와
                          함께 입 안에서 섬세한 나무의 맛과 과실향의 발란스가
                          좋다.
                        </p>
                      </div>
                    </div>
                  </div>
                </section>
              </div>
            </div>
          </div>
        </section>
      </div>
      <!-- Javascript Files -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script src="..\js\menu.js"></script>
    </div>
  </body>
</html>

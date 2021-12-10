<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%
	//디비 환경 변수
	String driver = "";
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;
	int user = 0;
	int count = 0;

	String id = request.getParameter("id");
	String password = request.getParameter("pswd");
       
	try{
		//데이터베이스 접속
       	Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		con = DriverManager.getConnection(url,"root","0000");

		//id와 pwd를 데이터베이스에서 찾아서 로그인 항목으로 가기
		sql = "select * from member where id ='"+ id +"' and password='"+password+"'";
		pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
		rs = pstmt.executeQuery(sql);

		rs.last();
		count = rs.getRow();
		
		rs.close();
		pstmt.close();
		con.close();
	} catch (ClassNotFoundException e) { 
		System.out.println("드라이버 로드 실패");
	} catch (SQLException e) {
        System.out.println("DB 접속 실패");
        e.printStackTrace();
    }
	
	//로그인 성공시(아이디가 있음)
	if(count > 0){
		//세션 설정(사용자아이디 ID)
		session.setAttribute("ID", id);
		%>
		<script type="text/javascript">
			alert("로그인 성공!");
			document.location.href = "mainpage.html";
		</script>
		<%
	}
	else{	//로그인 실패시
		System.out.println("로그인 안됨 " + count);
		%>
		<script type="text/javascript">
			alert("회원이 아니거나 비밀번호가 다릅니다.");
			document.location.href = "Login.html";
		</script>
		<%
	}
%>
</body>
</html>
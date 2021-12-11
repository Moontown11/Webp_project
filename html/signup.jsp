<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
	//디비 환경 변수
	String driver = "";
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	String sql = null;
	ResultSet rs = null;

	String id = request.getParameter("id");
	String password = request.getParameter("pswd");
	String name = request.getParameter("name");


	try{
		//데이터베이스 접속
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
		con = DriverManager.getConnection(url,"root","0000");

      	//DB에서 아이디 패스워드 검색
        sql = "select * from member where id='"+id+"'";
		pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
		stmt=con.createStatement();
        rs = pstmt.executeQuery(sql);
        rs.last();
        int count = rs.getRow();
		//회원이 아닐 경우
        if(count <= 0){
        	//회원가입 처리
			sql = "insert into member values('"+ id +"','"+ name +"','"+ password +"')";
			stmt.executeUpdate(sql);
			%>
			<script>
			location.href="Login.html"
			</script>
			<%
		}
       	else{
       		//이미 회원가입되어있음
       		out.println("이미 회원입니다.<br>");
       		%>
			<script>
			location.href="Login.html"
			</script>
			<%
       	}
		stmt.close();
		pstmt.close();
		con.close();
	} catch (ClassNotFoundException e) { 
		System.out.println("드라이버 로드 실패");
	} catch (SQLException e) {
        System.out.println("DB 접속 실패");
        e.printStackTrace();
    }
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<html>
<body>
	<%
	String m_id = (String)session.getAttribute("ID");
	//������ ���� ���
	if(m_id == null){
	%>
		<script>
		alert("�α��� �� �ۼ��ϼ���!");
		document.location.href = "Notice.jsp";
		</script>
	<%
	}else{ //���� ������
	%>
	
	<% 
		int id;
		String title="", content="";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
	    id = Integer.parseInt(request.getParameter("id"));
		title = request.getParameter("title");
		content = request.getParameter("content");
		
			try{
				Class.forName("com.mysql.jdbc.Driver");
	            String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
	            conn = DriverManager.getConnection(url, "root", "0000");
	            stmt = conn.createStatement();
	            String sql_update = "update notice set title= '"+ title +"', content='" + content + "' where id = " + id;
	            	stmt.executeUpdate(sql_update);
			}
			catch(Exception e){
				out.println("DB ���� �����Դϴ�.:" + e.getMessage());
			}
%>

		<script>
		alert("�Խñ��� �����Ǿ����ϴ�!");
		document.location.href = "Notice.jsp";
		</script>
	
	<%
	}
	%>
</body>
</html>
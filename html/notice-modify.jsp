<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("EUC-KR"); %>
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
	    PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		String name= null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
            conn = DriverManager.getConnection(url, "root", "0000");
            stmt = conn.createStatement();
            
   	     	rs = stmt.executeQuery("select * from notice where id = " + id );
		  	     	
	  	    String sql2 = "select name from member where id = ?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1,m_id);
			rs2 = pstmt2.executeQuery();
		}
		catch(Exception e){
			out.println("DB ���� �����Դϴ�.:" + e.getMessage());
		}
			
		if(rs2.next()){
			name = rs2.getString("name"); //���� ���� ��� �̸�
		}	
		while(rs.next()){
			 String author = rs.getString("name"); //�Խñۿ� ����� �ۼ���
			if(!author.equals(name))
			{
			%>
		<center><h2>�ۼ��ڰ� �ٸ��ϴ�.</h2>
		<a href="notice-read.jsp?id=<%=id %>">�ڷ�</a>
		</center>
		<%
			}
			else {
		%>
		<center><h2>�Խñ� ����</h2><br><br>
		<form action="notice-modify-db.jsp" method="post">
		<table border = "0">
			<tr>
				<td>�� �� �� : </td>
				<td><input type = "text" name = "title" size = "50"></td>
			</tr>
			<tr>
				<td valign="top">�� �� �� : </td>
				<td><textarea name="content" cols="65" rows="4"></textarea></td>
			</tr>
		</table><br><br>
		<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
		
		<input type="submit" value="����ϱ�">
		<input type="reset" value="�ٽþ���">		
		</form>

		<a href="notice-read.jsp?id=<%=request.getParameter("id") %>">���</a>
		</center>
		
		<%
					}
						}
		%>
		
	<%
	}
	%>
</body>
</html>
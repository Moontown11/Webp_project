<%@ page language="java" contentType="text/html; charset=EUC-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("EUC-kr"); %>
<html>
  <body>
    <%
	String m_id = (String)session.getAttribute("ID");
	//������ ���� ���
	if(m_id == null){
	%>
		�α��� �� �ۼ��ϼ���.<br>
		<a href="Login.html">�α���</a>
	<%
	}else{ //���� ������
	%>
	
	<%
    int id; //�Խñ� id��
    String sql,sql1;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    id = Integer.parseInt(request.getParameter("id"));
   
    PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	String name= null;
	 
    try { 
         Class.forName("com.mysql.jdbc.Driver");
	     String url = "jdbc:mysql://localhost:3306/webproject?serverTimezone=UTC";
	     conn = DriverManager.getConnection(url, "root", "0000");
	     stmt = conn.createStatement();
	     
	     sql = "select * from notice where id = " + id;
	     rs = stmt.executeQuery(sql);
	     
		 String sql2 = "select name from member where id = ?";
		 pstmt2 = conn.prepareStatement(sql2);
		 pstmt2.setString(1,m_id);
		 rs2 = pstmt2.executeQuery();
		 
		 
       }
       catch(Exception e) {
           out.println("DB ���� �����Դϴ�. : " + e.getMessage());
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
    <a href="notice-read.jsp?id=<%= id %>">�ڷ�</a>
    </center>
    
    <%
    	 }
    	 else
    	 {
    		 sql1="delete from notice where id = " + id;
    		 try{
    			 stmt.executeUpdate(sql1);
    		 }
    		 catch(Exception e){
    			 out.println("DB ���� �����Դϴ�.:" + e.getMessage());
    		 }
    %>
    	<script>
    	alert("�Խñ� ���� �Ϸ�!");
    	document.location.href = "Notice.jsp";
    	</script>
    <%
    		break;
    		}
    	}
    %>
    
	<%
	}
	%>
  </body>
</html>
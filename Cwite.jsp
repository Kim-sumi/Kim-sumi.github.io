<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   String name = request.getParameter("name");
   String password = request.getParameter("pass");
   String content = request.getParameter("content");
   
   //db접속해서 sql연동
   String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
   String dbID = "scott";
   String dbPassword = "tiger";
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql = "insert into comments(seq, name, pass, content) values ((select max(seq)+1 from comments), ?, ?, ?)";
   
   try{
      Class.forName("oracle.jdbc.driver.OracleDriver"); //DB연결
      conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
   } catch(SQLException e){
      System.out.println("[오류]:" + e.getMessage());}
   
   pstmt.setString(1, name);
   pstmt.setString(2, password);
   pstmt.setString(3, content);
   pstmt.executeUpdate();
   
   pstmt.close();
   conn.close();
   response.sendRedirect("Clist.jsp");
   
%>

</body>
</html>
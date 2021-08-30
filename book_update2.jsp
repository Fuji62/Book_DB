<%-- book_update2.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int cnt = Integer.parseInt(request.getParameter("cnt"));
Connection db = null;
PreparedStatement ps = null;

try{
	Context context = new InitialContext();
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/abcdpool");
	db = ds.getConnection();
	db.setAutoCommit(false);
	ps = db.prepareStatement("UPDATE book SET month_sales=? WHERE isbn=?");

	for(int i=1; i<=cnt; i++){
		if(request.getParameter("month_sales" + i) != ""){
			ps.setInt(1, Integer.parseInt(request.getParameter("month_sales" + i)));
			ps.setString(2, request.getParameter("isbn" + i));
			ps.executeUpdate();
		}
	}
	db.commit();

}catch(Exception e){
	throw new ServletException(e);
}finally{
	try{
		if(ps != null){ps.close();}
		if(db != null){db.close();}
	}catch(Exception e){}
}
response.sendRedirect("book_update1.jsp");
%>
</body>
</html>

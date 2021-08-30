<%-- book_delete2.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
//book_
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
	ps = db.prepareStatement("DELETE from book WHERE isbn=?");

	for(int i=1; i<=cnt; i++){
		System.out.println(request.getParameter("delete" + i));
		if(request.getParameter("delete" + i) != null){
			System.out.println(request.getParameter("isbn" + i));
			ps.setString(1, request.getParameter("isbn" + i));
			System.out.println(ps);
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
response.sendRedirect("book_delete1.jsp");
%>
</body>
</html>

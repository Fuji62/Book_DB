<%-- book_ichiran.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>一覧表</title>
</head>
<body>
<table border="1">
<tr>
<th>ISBNコード</th><th>書名</th><th>価格</th><th>出版社</th><th>刊行年月日</th>
</tr>
<%
request.setCharacterEncoding("UTF-8");
Connection db = null;
PreparedStatement ps = null;
ResultSet rs = null;
try{
	Context context = new InitialContext();
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/abcdpool");
	db = ds.getConnection();

	ps = db.prepareStatement("SELECT * FROM book");
	rs = ps.executeQuery();

	while(rs.next()){
%>
	<tr>
	<td><%=rs.getString("isbn") %></td>
	<td><%=rs.getString("title") %></td>
	<td><%=rs.getInt("price") + "円" %></td>
	<td><%=rs.getString("publish") %></td>
	<td><%=rs.getString("published") %></td>
	</tr>
<%
	}
}catch(Exception e){
	throw new ServletException(e);
}finally{
	try{
		if(rs != null){rs.close();}
		if(ps != null){ps.close();}
		if(db != null){db.close();}
	}catch(Exception e){}
}
%>
</table>
<form action="insert_form_book.jsp" method="post">
	<input type="submit" value="戻る">
</form>
</body>
</html>

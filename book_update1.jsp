<%-- book_update1.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form method="POST" action="book_update2.jsp">
		<input type="submit" value="更新">
		<table border="1">
			<tr>
				<th>書籍名</th><th>価格</th><th>出版社</th><th>在庫数</th><th>購入数</th>
			</tr>
<%
		int cnt = 0;
		Connection db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try{
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/abcdpool");
			db = ds.getConnection();
			ps = db.prepareStatement("select * from book order by published DESC");
			rs = ps.executeQuery();
			while(rs.next()){
				cnt++;
%>
	<tr>
		<td>
			<input type="hidden" name="isbn<%=cnt %>" value="<%=rs.getString("isbn") %>" />
			<input type="text" name ="title<%=cnt %>" size="50" value="<%=rs.getString("title") %>" />
		</td>
		<td>
			<input type="text" name="price<%=cnt %>" size="5" value="<%=rs.getString("price") %>" />
		</td>
		<td>
			<input type="text" name="publish<%=cnt %>" size="10" value="<%=rs.getString("publish") %>" />
		</td>
		<!-- 在庫数 stocks-->
		<td>
			<input type="text" name ="title<%=cnt %>" size="5" value="<%=rs.getString("stocks") %>" />
		</td>
		<!-- 購入数 num_of_purchases -->
		<td>
			<input type="number" name="month_sales<%=cnt %>" size="5">
		</td>
	</tr>
<%
			}//while文の終わり
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
		<input type="hidden" name="cnt" value="<%=cnt %>" />
	</form>
</body>
</html>

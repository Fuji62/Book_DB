<%-- cart_check.jsp --%>

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
<form method="POST" action="book_delete2.jsp">
	<input type="submit" value="削除">
	<table border="1">
	<tr>
		<th></th><th>書籍名</th><th>価格</th><th>数量</th><th>金額</th>
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
			ps = db.prepareStatement("select * from cart");
			rs = ps.executeQuery();
			while(rs.next()){
				cnt++;
%>
	<tr>
	<td>
	<input type="hidden" name="isbn<%=cnt %>" value="<%=rs.getString("isbn") %>" />
	<input type="checkbox" name="delete<%=cnt %>" value="1">
	</td>
	<td>
	<input type="text" name ="title<%=cnt %>" size="50" value="<%=rs.getString("title") %>" />
	</td>
	<td>
	<input type="text" name="price<%=cnt %>" size="5" value="<%=rs.getString("price") %>" />
	</td>
	<td>
	<input type="text" name="num_of_items<%=cnt %>" size="10" value="<%=rs.getString("num_of_items") %>" />
	</td>
	<td>
	<input type="text" name="amount" value="    price * num_of_items       ">
	</td>
	</tr>
	</table>
	<p>合計金額：●●円</p>
	<input type="submit" value="削除">
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
	<input type="hidden" name="cnt" value="<%=cnt %>" />
</form>
<form method="POST" action="pay_complete.jsp">

</form>
</body>
</html>

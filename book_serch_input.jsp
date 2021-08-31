<%-- book_serch_input.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書籍検索</title>
</head>
<body>
<header>
<h2>書籍検索</h2>
<a href="insert_form_book.jsp">→TOP</a>
</header>
<main>
	<form action="book_search_process.jsp" method="post">
	<dl>
		<dt>書名：</dt>
		<dd><input type="text" name="title" placeholder="例:リファレンス"></dd>
		<dt>出版社名：</dt>
		<dd><input type="text" name="publish" placeholder="例:技術"></dd>
	</dl>
	<input name="button" type="reset" value="キャンセル">
	<input name="button" type="submit" value="検索">
	</form>
	<br>
	<br>
	<!-- ------------------------------------------------------------------------------- -->
	<form action="cart_add.jsp" method="post">
	<table>
		<tr>
	 		<th>チェック</th><th>商品名</th><th>在庫</th><th>数量</th>
		</tr>
<%
	request.setCharacterEncoding("UTF-8");
	int cnt = 0;
	String query = (String)session.getAttribute("query");
	Connection db = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	try{
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/abcdpool");
		db = ds.getConnection();
		ps = db.prepareStatement(query);
		System.out.println("クエリ > " + query);//★確認用
		rs = ps.executeQuery();
		while(rs.next()){
			cnt++;
%>
		<tr>
			<td>
				<input type="checkbox" name="check" value="1" size="3">
			</td>
			<td>
				<input type="text" name="title" value="<%=rs.getString("title") %>" size="30" />
			</td>
			<td>
				<input type="text" name="stocks" value="<%=rs.getString("stocks") %>" size="5" />
			</td>
			<td>
				<input type="text" name="num_of_items" placeholder="購入数を入力" size="10" />
			</td>
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
	<input type="submit" value="カートに入れる">
	<input type="reset" value="キャンセル">
	<input type="hidden" name="cnt" value="<%=cnt %>" />
	</form>
</main>
</body>
</html>

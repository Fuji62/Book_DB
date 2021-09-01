<%-- book_serch_process --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.*, java.util.*"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	final String URL =
	  "jdbc:mysql://localhost:3306/basic?characterEncoding=UTF-8&useSSL=false &serverTimezone=GMT%2B9";
	final String USERNAME = "root";
	final String PASSWORD = "rootroot";
	Connection con = null;

	//
	int sessionFlg = (int)session.getAttribute("sessionFlg");
	sessionFlg = 1;
	session.setAttribute("sessionFlg", sessionFlg);

	//カートテーブルを作成(DBにcartテーブルがあると例外になる)
	Connection db = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try{
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/abcdpool");
		db = ds.getConnection();
		ps = db.prepareStatement("create table cart(isbn varchar(17), num_of_items int);");
		//rs = ps.executeQuery();
		ps.executeUpdate();
	}catch(Exception e){
		throw new ServletException(e);
	}finally{
		try{
			if(rs != null){rs.close();}
			if(ps != null){ps.close();}
			if(db != null){db.close();}
		}catch(Exception e){}
	}

	//検索条件と同じセレクト文を作成
	String query = "SELECT * FROM book WHERE";
	String[][] item = {{"title","publish"},{"",""}};
	item[1][0] = request.getParameter("title");
	item[1][1] = request.getParameter("publish");
	int flg = 0;

	for(int i = 0; i < 2; i++) {
		if(item[1][i] != "") {
			query += " " + item[0][i] + " like '%" + item[1][i] +"%'";
			flg++;
			if(flg != 0 && i != 2 - 1 && item[1][i + 1] != ""){
				query += " &&";
			}
		}
	}
	query += ";";

	//クエリを保存してフォワード
	session.setAttribute("query", query);
	String path = "book_search_input.jsp";
	request.getRequestDispatcher(path).forward(request, response);
%>

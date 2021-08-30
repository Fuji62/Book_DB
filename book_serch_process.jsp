<%-- book_serch_process --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.*, java.sql.*, java.util.*"%>
<%
	final String URL =
	  "jdbc:mysql://localhost:3306/basic?characterEncoding=UTF-8&useSSL=false &serverTimezone=GMT%2B9";
	final String USERNAME = "root";
	final String PASSWORD = "rootroot";
	Connection con = null;

	String query = "SELECT * FROM book WHERE";
	String[][] item = {{"isbn","title","price","publish","published"},{"","","","",""}};
	item[1][0] = request.getParameter("isbn");//スコープに保存されている入力データを指定
	item[1][1] = request.getParameter("title");  //両方向のMapが使えるならMapに変える
	item[1][2] = request.getParameter("price");
	item[1][3] = request.getParameter("publish");
	item[1][4] = request.getParameter("published");
	int flg = 0;

	for(int i = 0; i < 5; i++) {
		if(item[1][i] != "") { query += " " + item[0][i] + " like '%" + item[1][i] +"%'"; flg++; }
		if(flg != 0 && i != 5 - 1 && item[1][i + 1] != ""){ query += " &&"; }
	}
	query += ";";

	//クエリを保存してフォワード
	session.setAttribute("query", query);
	String path = "search_result.jsp";
	request.getRequestDispatcher(path).forward(request, response);
%>


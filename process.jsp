<%-- process.jsp --%>

<%@ page  import="java.io.*, java.util.*, java.nio.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String button = request.getParameter("button");
	if(button.equals("登録")){ //→ファイル出力処理へ
		String path = "book.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}else if(button.equals("一覧表")){ //→ファイル入力処理へ
		String path = "book_ichiran.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}else if(button.equals("検索")){ //→検索処理へ
		String path = "book_search_process.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}
%>

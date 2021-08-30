<%-- book_serch.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<h2>検索図書</h2>
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
</main>
</body>
</html>

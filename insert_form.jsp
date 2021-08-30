<%-- insert_form.jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>
</head>
<body>
<header><h2>BOOK</h2></header>
<main>
	<form action="process.jsp" method="post">
	<dl>
		<dt>ISBNコード：</dt>
		<dd><input type="text" name="isbn" placeholder="例:978-4-8222-9613-1"></dd>
		<dt>書名：</dt>
		<dd><input type="text" name="title" placeholder="例:アプリを作ろう！Android入門"></dd>
		<dt>価格：</dt>
		<dd><input type="text" name="price" placeholder="例:1995">円</dd>
		<dt>出版社名：</dt>
		<dd><input type="text" name="publish" placeholder="例:日経BP"></dd>
		<dt>刊行年月日：</dt>
		<dd><input type="date" name="published" placeholder="例:2012-09-13"></dd>
	</dl>
	<input name="button" type="submit" value="登録">
	<input name="button" type="reset" value="キャンセル">
	<input name="button" type="submit" value="一覧表">
	<input name="button" type="submit" value="検索">
	</form>
</main>
</body>
</html>

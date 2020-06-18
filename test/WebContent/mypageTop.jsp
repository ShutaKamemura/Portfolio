<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
<link rel="stylesheet" href="mypageTop.css" type="text/css">
</head>
<body>
<div class="form-wrapper">
	<h2>ログインページ</h2>
<div>
	<div class="message">${message}</div>
	<div style="color: #00dbdb">${message2}</div>
	<form action="LoginServlet" method="post">
	
	<div class="form-item">
	<label></label>
		<p>USER　NAME</p>
			<input type="text" name="name"></input>
	</div>
	
	<div class="form-item">
	<label></label>
		<p>PASSWORD</p>
			<input type="password" name="pass"></input>
	</div>
	
	<div class="button-panel">
	<button>Login</button>
	</div>
	</form>
	</div>
</div>

</body>
</html>
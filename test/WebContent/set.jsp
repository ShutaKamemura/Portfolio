<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>設定</title>
<script src="https://kit.fontawesome.com/75beac86c5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>

<h3>設定画面を表示しています</h3>
<div class="tab">
	<div class="btn-group-vertical">
			<form action="MypageServlet" method="get">
				<button name="btn" value="home" class="btn btn-dark">
				<i class="fas fa-home fa-fw"></i>HOME</button>
			</form>
			
			<form action="MypageServlet" method="get">
				<button name="btn" value="search" class="btn btn-dark">
				<i class="fa fa-search fa-fw"></i>検索</button>
				<input type="hidden" name="selectWay" value="username">
			</form>
			
			<form action="MypageServlet" method="get">
				<button name="btn" value="like" class="btn btn-dark">
				<i class="fa fa-navicon fa-fw"></i>ライブラリ</button>
			</form>
			
			<form action="MypageServlet" method="get">
				<button name="btn" value="set" class="btn btn-dark">
				<i class="fas fa-cog fa-spin"></i>設定</button>
			</form>

		</div>
		</div>

<div>
<a>アカウント設定</a>
</div>
<div>
	<form action="SetServlet" method="post">
		<button name="btn" value="logout">
		<a>ログアウト</a></button>
	</form>
</div>
</body>
</html>
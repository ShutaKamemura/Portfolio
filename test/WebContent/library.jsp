<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ライブラリ</title>
<script src="https://kit.fontawesome.com/75beac86c5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<h4>ライブラリページに移動しました</h4>
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
<a>保存した再生リスト</a>

</body>
</html>
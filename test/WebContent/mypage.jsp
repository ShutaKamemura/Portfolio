<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>マイページ</title>
<script src="https://kit.fontawesome.com/75beac86c5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="mypage.css" rel="stylesheet">
</head>

<body>
<header>
	<div class="con">

		<h2>サイト名</h2>
		<a>${login2}さんのマイページ</a>
	
		<div class="tab" onclick="obj=document.getElementById('open').style; obj.display=(obj.display=='none')?'block':'none';">
			<h6 style="cursor: pointer;">メニュー</h6>
		</div>
		<div id="open" style="display:none;clear:both;">
	
			<div class="header-left">
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
		</div>

		

	</div>	
</header>
	<div class="inline-block_test">
	<h3>今週のおすすめ</h3>
	</div>
	<div class="inline-block_test">
	<h3>今月のおススメ</h3>
	</div>
	<div class="inline-block_test">
	<h3>今年のおすすめ</h3>
	<!-- 作品の表示 -->
	</div>
</body>
</html>
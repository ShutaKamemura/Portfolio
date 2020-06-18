<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>検索</title>
<script src="https://kit.fontawesome.com/75beac86c5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<h3>検索画面に遷移できました</h3>
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
		
<form action="SearchServlet" method="get">
	<div>
		<input type="text" name="name" class="form-control" id="Name" placeholder="作品名">
		<button name="btn">検索</button>
		<input type="hidden" name="selectWay" value="name">
	</div>
</form>

<form action="SearchServlet" method="get">
	<div>
		<input type="text" name="category" class="form-control" id="Name" placeholder="ジャンル">
		<button name="btn">検索</button>
		<input type="hidden" name="selectWay" value="category">
	</div>
</form>

<div>
	<c:if test="${list != null}">
	<h4>[${list}]で検索</h4>
		<table class="table table-striped">
			<tr>
				<th>作品ID</th><th>コード</th><th>作品名</th><th>カテゴリ</th><th>保存</th>
			</tr>
			
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.id}</td><td>${item.code}</td><td>${item.name}</td><td>${item.category}</td>
					<td>
						<form action="" method="get">
							<button name="btn" value="keep">ライブラリに保存する</button>
							<input type="hidden" name="code" value="${item.code}">
						</form>
				
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

</body>
</html>
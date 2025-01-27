<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>検索</title>
<script src="https://kit.fontawesome.com/75beac86c5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="search.css" rel="stylesheet">
</head>
<body>
<header>
<h3>検索</h3>
		<div class="tab" onclick="obj=document.getElementById('open').style; obj.display=(obj.display=='none')?'block':'none';">
			<button class="btn btn-dark">
			<h6 style="cursor: pointer;">メニュー</h6></button>
		</div>
		<div id="open" style="display:none;clear:both;">
	
			<div class="header-left">
				<div class="btn-group-vertical" role="group" aria-label="積み重ねボタングループ">
				
				<form action="MypageServlet" method="get">
					<button name="btn" value="home" class="btn btn-dark" style="width: 130px;">
					<i class="fas fa-home fa-fw"></i>HOME</button>
				</form>
				
				<form action="MypageServlet" method="get">
					<button name="btn" value="search" class="btn btn-dark" style="width: 130px;">
					<i class="fa fa-search fa-fw"></i>検索</button>
					<input type="hidden" name="selectWay" value="username">
				</form>
				
				<form action="MypageServlet" method="get">
					<button name="btn" value="like" class="btn btn-dark" style="width: 130px;">
					<i class="fa fa-navicon fa-fw"></i>ライブラリ</button>
				</form>
				
				<form action="MypageServlet" method="get">
					<button name="btn" value="set" class="btn btn-dark" style="width: 130px;">
					<i class="fas fa-cog fa-fw"></i>設定</button>
				</form>
				
				</div>
			</div>
		</div>
</header>
<br>
<a>作品名から探す</a>
<form action="SearchServlet" method="get">
	<div>
		<input type="text" name="name" class="form-control" id="Name" placeholder="作品名">
		<button name="btn" class="btn-dark"><i class="fa fa-search fa-fw"></i></button>
		<input type="hidden" name="selectWay" value="name">
	</div>
</form>

<br>
<a>カテゴリで探す</a>
<form action="SearchServlet" method="get">
	<div>
		<select type="text" name="category" class="form-control" id="Name" placeholder="ジャンル">
			<option>SF</option>
			<option>アニメ</option>
			<option>アクション</option>
		</select>	
		<button name="btn" class="btn-dark"><i class="fa fa-search fa-fw"></i></button>
		<input type="hidden" name="selectWay" value="category">
	</div>
</form>

<br>
<div>
	<c:if test="${list != null}">
	<h4> 【${search}で検索】</h4>
		<div class="container">
			<div class="row">
			<c:forEach var="item" items="${list}">
				<tr>
				<div class="col-lg-4">
					
					<video style="width: 300px; height: 200px;" src="${item.replay}.mp4" poster="${item.img}.jpg" id="${item.name}">
						<source src="${item.replay}.mp4" type="video/mp4">
					</video>
					<br>
					
					<button id="${item.id}" style="background: #fafafa">
					<i class="fa fa-play-circle-o "></i> 再生する</button>
					<script>
 					 var goFS = document.getElementById("${item.id}");
					  goFS.addEventListener("click", function() {
						     var video = document.getElementById("${item.name}");
							    video.requestFullscreen();
 						}, false);
	 
						 video.onclick = function (event) { 
						  if (video.fullscreenElement) { 
						    video.exitFullscreen() 
						  } 
						};
					</script>
					
					<br>${item.name}<br>[${item.category}]<br>
					
					<form action="MypageServlet" method="get">
						<button name="btn" value="keep" style="background: #575757">＋ 保存</button>
						<input type="hidden" name="id" value="${item.id}">
					</form>
					<br>
					<br>
				</div>
				</tr>
			</c:forEach>
			</div>
		</div>
	</c:if>
</div>

</body>
</html>
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
<link href="library.css" rel="stylesheet">
</head>
<body>
<header>
<h3>ライブラリ</h3>
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

<div class="inline-block_test">
	<h4>保存した再生リスト</h4>
	<br>
</div>

<div>
	<c:if test="${listLibrary != null}">
	
		<div class="container">
			<div class="row">
			<c:forEach var="item" items="${listLibrary}">
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
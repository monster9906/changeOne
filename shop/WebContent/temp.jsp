<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/public/head.jspf" %>
	<link rel="stylesheet" href="${shop}/css/bootstrap.css">
<link rel="stylesheet" href="${shop}/css/animate.min.css">
<link rel="stylesheet" href="${shop}/css/main.css">
<script type="text/javascript" src="${shop}/js/bootstrap.js"></script>
</head>
<body>
	<div id="myCarousel" style="width: 650px" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="${shop}/images/lm_banner_1.jpg" style="400px" alt="First slide">
			</div>
			<div class="item">
				<img src="${shop}/images/lm_banner_1.jpg" style="400px" alt="Second slide">
				<div class="carousel-caption">
					<h3>老牛牌充电宝</h3>
					<p>老牛牌充电巨牛逼</p>
				</div>
			</div>
			<div class="item">
				<img src="${shop}/images/lm_banner_1.jpg" style="400px" alt="Third slide">
				<div class="carousel-caption">
					<h3>老牛牌充电宝</h3>
					<p>老牛牌充电巨牛逼</p>
				</div>
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/public/head.jspf" %>
<link rel="stylesheet" href="${shop}/css/bootstrap.css">
<link rel="stylesheet" href="${shop}/css/animate.min.css">
<link rel="stylesheet" href="${shop}/css/main.css">
<script type="text/javascript" src="${shop}/js/bootstrap.js"></script>
<style type="text/css">
	#myCarousel { width: 780px; float: right; margin-top: 17px; }
	#myCarousel img{ width:780px; height:370px; }
</style>
</head>
<body>
		<div class="wrapper">
        <div class="header">
            <div class="header_container">
                <!--头部开始-->
                        <div class="top_bar clear">
                            <!--头部小导航-->
                            <div class="welcom fl">欢迎光临E~Go SHOP! </div>
                            <ul class="top_links fr">
                                <li class="highlight"><a href="${shop}/index.jsp">首页</a></li>
                                <li><a href="${shop }/sorder_showCar.action">购物车</a></li>
                                <li><a href="#">注册</a></li>
                                <c:if test="${empty user}">
                                <li ><a href="${shop}/ulogin.jsp">登录</a></li>
                                </c:if>
                                <c:if test="${not empty user}">
                                <li ><a href="#">欢迎您!${user.name }</a> </li>
                                </c:if>
                            </ul>
                            <!--头部小导航结束-->
                            <!-- logo -->
                            <h1 class="logo clear fl"> <a href="${shop}/index.jsp"><img src="image/logo.jpg" height="80px" width="150px"/></a> </h1>
                            <!-- 购物车 -->
                            <c:if test="${not empty user}">
                            <div class="minicart">
                                <a class="minicart_link" href="${shop }/sorder_showCar.action">
                                    <span class="item">
                                        <b>我的购物车</b>        
                                    </span><br/>
                                </a>
                            </div>
                            </c:if>
                            <!-- 购物车结束 -->
                            <!-- 搜索框 -->
                            <div class="header_search" style="height:35px ">
                                <div class="form-search ">
                                    <input  value="请输入商品名称" class="input-text"  name= "search" type="text"/>
                                    <button type="submit" onclick="search()" title="Search"></button>
                                </div>
                            </div>
                   
                        </div>
                    
            </div>
        </div>
        <!-- 头部结束 -->

        <!-- 导航栏 -->
        <div class="navigation_container">
        <!---->
         <div class="nav">
            <ul class="primary_nav">
            <c:forEach items="${applicationScope.bigList}" var="list" varStatus="i">
            	
            	<c:if test="${not empty list[0].category.type && i.count  == 1}">
            		<li class="active highlight">
                	<a href="#">${list[0].category.type}</a>    
                </li>
            	</c:if>
            	<c:if test="${not empty list[0].category.type && i.count  != 1}">
            		<li>
                	<a href="#">${list[0].category.type}</a>    
                </li>
            	</c:if>
            	
            </c:forEach>
                <!--二级菜单结束-->
            </ul>
        </div>
        </div>
        <!--导航栏结束-->

        
        <div class="section_container">
            <!--左侧导航-->
            <div id="side_nav">
                <div class="sideNavCategories">
                    <h1>女装</h1>
                    <ul class="category departments">
                        <li class="header">分类</li>
                        <li><a href="#">毛衣</a></li>
                        <li><a href="#">针织衫 </a></li>
                        <li><a href="#">衬衫 </a></li>
                        <li><a href="#">T恤</a></li>
                        <li><a href="#">短裤</a></li>
                        <li><a href="#">牛仔 </a></li>
                        <li><a href="#">连身裙</a></li>
                        <li><a href="#">短裙 </a></li>
                    </ul>
                </div>
                
            </div>
            <!-- 右侧焦点图区域 -->
            <div id="myCarousel" class="carousel slide">
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
					</div>
					<div class="item">
						<img src="${shop}/images/lm_banner_1.jpg" style="400px" alt="Third slide">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		            
        </div>

           <!-- 产品列表 -->
           <!--大循环开始-->
			<c:forEach items="${applicationScope.bigList}" var="list">
			<c:if test="${not empty list[0].category.type}">
            <div class="products_list products_slider clear">
                <h2 class="sub_title">${list[0].category.type}</h2>
                <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
                   	<!--小循环开始-->
					<c:forEach items="${list}" var="product">
                    <li> 
                    <a  href="${shop}/product_get.action?id=${product.id}" class="product_image">
                    <img src="${shop}/image/${product.pic}" />
                    </a>
                        <div class="product_info">
                            <h3><a href="#">${product.name}</a></h3>
                            <small>印花 纯棉</small> </div>
                        <div class="price_info"> 
                            <button><span class="pr_add">添加购物车</span></button>
                            <button class="price_add" title="" type="button"><span class="pr_price">￥${product.price}</span></button>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            </c:forEach>
        <!--产品列表结束  -->

        <!-- 导航栏结束 -->
        <div class="footer_container">


        <div class="footer">
            <ul class="footer_links">
                <li> <span>收藏本店</span>
                    <ul>
                        <li><a href="#">服装</a></li>
                        <li><a href="#">鞋子</a></li>
                        <li><a href="#">包包</a></li>
                        <li><a href="#">装饰品</a></li>
                        <li><a href="#">channel</a></li>
                        <li><a href="#">prada</a></li>
                        <li><a href="#">LV</a></li>
                    </ul>
                </li>
                <li class="seperator"> <span>出售的品牌</span>
                    <ul>
                        <li><a href="#">Elle</a></li>
                        <li><a href="#">Reallxe</a></li>
                        <li><a href="#">Fabric</a></li>
                        <li><a href="#">Mayflower</a></li>
                        <li><a href="#">Levis Strauss</a></li>
                        <li><a href="#">Anzonica</a></li>
                        <li><a href="#">Reallxe</a></li>
                        <li><a href="#">Fabric</a></li>
                    </ul>
                </li>
                <li> <span>客户服务</span>
                    <ul>
                        <li><a href="#">帮助</a></li>
                        <li><a href="#">速递</a></li>
                        <li><a href="#">退换货</a></li>
                        <li><a href="#">付款方式</a></li>
                        <li><a href="#">订单跟踪</a></li>
                        <li><a href="#">礼物包选项</a></li>
                        <li><a href="#">国际服务</a></li>
                        <li><a href="#">退运险</a></li>
                    </ul>
                </li>
                <li> <span>个人账户</span>
                    <ul>
                        <li><a href="#">个人账户信息</a></li>
                        <li><a href="#">用户密码</a></li>
                        <li><a href="#">订单历史</a></li>
                        <li><a href="#">付款方式</a></li>
                        <li><a href="#">我的收货地址</a></li>
                        <li><a href="#">我的通知</a></li>
                    </ul>
                </li>
            </ul>
        </div>
   		</div>
</body>

<script type="text/javascript">
	function search(){
		$.ajax({ 
			type: 'GET',
			url: "test.html", 
			success: function(){
	        	$(this).addClass("done");
	      	}
      	});
	}
</script>
</html>
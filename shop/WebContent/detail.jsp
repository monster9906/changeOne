<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/public/head.jspf"%>
	<link rel="stylesheet" href="${shop}/css/detail.css" />
</head>
<body>
    <div class="wrapper">
        <div class="header">
            <div class="header_container">
                <!--头部开始-->
                <div class="top_bar clear">
                    <!--头部小导航-->
                    <div class="welcom fl">欢迎光临E~Go SHOP!</div>
                    <ul class="top_links fr">
                        <li class="highlight">
                            <a href="${shop}/index.jsp">首页</a>
                        </li>
                        <li>
                            <a href="${shop }/sorder_showCar.action">购物车</a>
                        </li>
                        <li>
                            <a href="#">注册</a>
                        </li>
                        <c:if test="${empty user}">
                                <li ><a href="${shop}/ulogin.jsp">登录</a></li>
                                </c:if>
                                <c:if test="${not empty user}">
                                <li ><a href="#">欢迎您!${user.name }</a> </li>
                        </c:if>
                    </ul>
                    <!--头部小导航结束-->
                    <!-- logo -->
                    <h1 class="logo clear fl">
                        <a href="${shop}/index.jsp"><img src="image/logo.jpg" height="80px" width="150px"/></a>
                    </h1>
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
                    <div class="header_search">
                        <div class="form-search ">
                            <input  value="请输入商品名称" class="input-text"  type="text"/>
                            <button type="submit" title="Search"></button>
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
                    <li class="active highlight">
                        <a href="#">女装</a>
                        <!--二级菜单-->
                        <ul class="sub_menu">
                            <li >
                                <a href="#">裙装</a>
                                <ul>
                                    <li>
                                        <a href="#">短裙</a>
                                    </li>
                                    <li>
                                        <a href="#">短裤</a>
                                    </li>
                                    <li>
                                        <a href="#">裤子</a>
                                    </li>
                                    <li>
                                        <a href="#">卡其裤</a>
                                    </li>
                                    <li>
                                        <a href="#">休闲裤</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔裤</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 运动夹克</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">装饰品</a>
                                <ul>
                                    <li>
                                        <a href="#">太阳镜</a>
                                    </li>
                                    <li>
                                        <a href="#">围巾</a>
                                    </li>
                                    <li>
                                        <a href="#">发饰品</a>
                                    </li>
                                    <li>
                                        <a href="#">帽子和手套</a>
                                    </li>
                                    <li>
                                        <a href="#">生活时尚</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔系列</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 西服</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!--二级菜单结束-->
                    <li>
                        <a href="#">男装</a>
                        <!--二级菜单-->
                        <ul class="sub_menu">
                            <li>
                                <a href="#">男士夏装</a>
                                <ul>
                                    <li>
                                        <a href="#">裤子</a>
                                    </li>
                                    <li>
                                        <a href="#">休闲裤</a>
                                    </li>
                                    <li>
                                        <a href="#">卡其裤</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔裤</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 运动夹克</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">装饰品</a>
                                <ul>
                                    <li>
                                        <a href="#">太阳镜</a>
                                    </li>
                                    <li>
                                        <a href="#">围巾</a>
                                    </li>
                                    <li>
                                        <a href="#">发饰品</a>
                                    </li>
                                    <li>
                                        <a href="#">帽子和手套</a>
                                    </li>
                                    <li>
                                        <a href="#">生活时尚</a>
                                    </li>
                                    <li>
                                        <a href="#">牛仔系列</a>
                                    </li>
                                    <li>
                                        <a href="#">风衣 & 西服</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <!--二级菜单结束--> </li>
                    <li>
                        <a href="#">儿童</a>
                    </li>
                    <li>
                        <a href="#">时尚</a>
                    </li>
                    <li>
                        <a href="#">装饰品</a>
                    </li>
                </ul>
            </div>
        </div>
        <!--导航栏结束-->
        <div class="section_container">
            <!-- 面包屑 -->
            <ul class="breadcrumb">
                <li>
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">女装</a>
                </li>
                <li class="active">
                    <a href="#">长裙</a>
                </li>
            </ul>
            <!-- 产品详情 -->
            <div id="product_detail">
                <!--详情左侧-->
                <div class="product_leftcol fl">
                    <div id="jingdong">
                        <div class="datu">
                            <img src="${shop}/image/${product.pic}" />
                            <div id="fangdajing"></div>
                        </div>
                        <div class="xiaotu">
                            <div class="leftbut"></div>
                            <div class="tu">
                                <ul>
                                	<c:forEach begin="0" end="10">
                                    <li>
                                        <img src="${shop}/image/${product.pic}" />
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="rightbut"></div>
                        </div>
                    </div>
                </div>
                <!--详情左侧结束-->
                <!--详情右侧-->
                <div class="product_rightcol fr">
                    <div id="name">
                        <h1>${product.name}</h1> <strong>${product.xremark}</strong>
                    </div>
                    <ul id="summary">
                        <li id="summary-market">
                            <div class="dt">参&nbsp;考&nbsp;价：</div>
                            <div class="dd"> <del id="page_maprice">￥${product.price}</del>
                            </div>
                        </li>
                        <li id="summary-price">
                            <div class="dt">折&nbsp;后&nbsp;价：</div>
                            <div class="dd"> <strong class="p-price" id="jd-price">￥${product.price}</strong>
                            </div>
                        </li>
                    </ul>
                    <ul id="choose" >
                        <li id="choose-color" class="choose-color-shouji">
                            <div class="dt">选择颜色：</div>
                            <div class="dd">
                                <div class="item">
                                    <b></b>
                                    <a href="#none" title="白色">
                                        <img data-img="1" src="images/11.jpg" width="25" height="25" alt="白色 "> <i>白色</i>
                                    </a>
                                </div>
                                <div class="item  selected">
                                    <b></b>
                                    <a href="#none" title="黑色">
                                        <img data-img="1" src="images/22.jpg" width="25" height="25" alt="黑色 "> <i>黑色</i>
                                    </a>
                                </div>
                            </div>
                        </li>
                        <li id="choose-version">
                            <div class="dt">选择尺码：</div>
                            <div class="dd">
                                <div class="item">
                                    <b></b>
                                    <a href="#none" title="S" style="cursor: pointer;">S</a>
                                </div>
                                <div class="item  selected">
                                    <b></b>
                                    <a href="#none" title="M" style="cursor: pointer;">M</a>
                                </div>
                                <div class="item">
                                    <b></b>
                                    <a href="#none" title="L" style="cursor: pointer;">L</a>
                                </div>
                                <div class="item">
                                    <b></b>
                                    <a href="#none" title="XL" style="cursor: pointer;">XL</a>
                                </div>
                                <div class="item">
                                    <b></b>
                                    <a href="#none" title="XXL" style="cursor: pointer;">XXL</a>
                                </div>
                            </div>
                        </li>
                        <li id="choose-amount">
                            <div class="dt">购买数量：</div>
                            <div class="dd">
								 <input value="1" size="2" >
                            </div>
                        </li>
                    </ul>
                    <div class="add_to_buttons">
                        <button class="add_cart"><a href="${shop}/sorder_addSorder.action?product.id=${product.id}">加入购物车</a></button>
                    </div>
                </div>
                <!--详情右侧结束--> 
                </div>
            <!--产品详情结束-->
            <!-- 产品列表 -->
            <c:forEach items="${applicationScope.bigList}" var="list">
            <c:if test="${not empty list[0].category.type}">
            <div class="products_list products_slider clear">
                <h2 class="sub_title">${list[0].category.type}</h2>
                
                   	<!--小循环开始-->
					<c:forEach items="${list}" var="product">
                <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
                    <li>
                        <a  href="${shop}/product_get.action?id=${product.id}"class="product_image">
                            <img src="${shop}/image/${product.pic}" />
                        </a>
                        <div class="product_info">
                            <h3>
                                <a href="#">${product.name}</a>
                            </h3>
                            <small>印花 纯棉</small>
                        </div>
                        <div class="price_info"></button>
                        <button>
                            <span class="pr_add">添加购物车</span>
                        </button>
                        <button class="price_add" title="" type="button">
                            <span class="pr_price">￥${product.price}</span>
                        </div>
                    </li>
                </ul>  
                    </c:forEach>
            </div>
            </c:if>
            </c:forEach>
            <!--产品列表结束  -->
           
            <!-- 导航栏结束 -->
            <div class="footer_container">
                <div class="footer">
                    <ul class="footer_links">
                        <li>
                            <span>收藏本店</span>
                            <ul>
                                <li>
                                    <a href="#">服装</a>
                                </li>
                                <li>
                                    <a href="#">鞋子</a>
                                </li>
                                <li>
                                    <a href="#">包包</a>
                                </li>
                                <li>
                                    <a href="#">装饰品</a>
                                </li>
                                <li>
                                    <a href="#">channel</a>
                                </li>
                                <li>
                                    <a href="#">prada</a>
                                </li>
                                <li>
                                    <a href="#">LV</a>
                                </li>
                            </ul>
                        </li>
                        <li class="seperator">
                            <span>出售的品牌</span>
                            <ul>
                                <li>
                                    <a href="#">Elle</a>
                                </li>
                                <li>
                                    <a href="#">Reallxe</a>
                                </li>
                                <li>
                                    <a href="#">Fabric</a>
                                </li>
                                <li>
                                    <a href="#">Mayflower</a>
                                </li>
                                <li>
                                    <a href="#">Levis Strauss</a>
                                </li>
                                <li>
                                    <a href="#">Anzonica</a>
                                </li>
                                <li>
                                    <a href="#">Reallxe</a>
                                </li>
                                <li>
                                    <a href="#">Fabric</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span>客户服务</span>
                            <ul>
                                <li>
                                    <a href="#">帮助</a>
                                </li>
                                <li>
                                    <a href="#">速递</a>
                                </li>
                                <li>
                                    <a href="#">退换货</a>
                                </li>
                                <li>
                                    <a href="#">付款方式</a>
                                </li>
                                <li>
                                    <a href="#">订单跟踪</a>
                                </li>
                                <li>
                                    <a href="#">礼物包选项</a>
                                </li>
                                <li>
                                    <a href="#">国际服务</a>
                                </li>
                                <li>
                                    <a href="#">退运险</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <span>个人账户</span>
                            <ul>
                                <li>
                                    <a href="#">个人账户信息</a>
                                </li>
                                <li>
                                    <a href="#">用户密码</a>
                                </li>
                                <li>
                                    <a href="#">订单历史</a>
                                </li>
                                <li>
                                    <a href="#">付款方式</a>
                                </li>
                                <li>
                                    <a href="#">我的收货地址</a>
                                </li>
                                <li>
                                    <a href="#">我的通知</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
	</body>
</html>

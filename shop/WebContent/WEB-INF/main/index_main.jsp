<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/public/head.jspf"%>
<style type="text/css">
		/* 设置div盒子的宽度, 和相应的字体信息 */
		#navigation {
			width: 200px;
			font-family: Arial, Helvetica, sans-serif;
		}
		/* 设置盒子里面的 ul */
		#navigation ul {
			list-style-type: none;
			margin: 0px;
			padding: 0px;
		}
		/* 设置ul 里面每个li的样式 */
		#navigation li {
			border-bottom: 1px solid #ed9f9f;
		}
		/* 设置 a标签的初始样式,对a标签的伪类样式都有效 */
		#navigation li a {
			display: block;
			padding: 5px 5px 5px 0.5em;
			text-decoration: none;
			border-left: 12px solid #E6AD65;
		}
		/* 重新设置  a:link a:visited样式 */
		#navigation li a:link,#navigation li a:visited {
			background-color:#B0E2FF;
			color: #ffffff;
		}
		#navigation li a:hover{
			background-color:#0081c2;
			color: #ffffff;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$("a[title]").click(function(){
				var text = $(this).text();
				var href= $(this).attr("title");
				if($("#tt").tabs("exists",text)){
					$("#tt").tabs("select",text);
				}else{
					$("#tt").tabs("add",{
						title:text,
						closeable:true,
						content:'<iframe title='+text+' src='+href+' frameborder="0" width="100%" height="100%"  />',
						closable:true
						});
				}
			});	
		});
	</script>
</head>
<body class="easyui-layout"> 
    <div data-options="region:'north',title:'E~Go商城'" style="height:120px;">
    	<img style="height: 100px;width: 100%" src="${shop}/image/head.jpg">
    </div>   
    
    <div data-options="region:'west',title:'操作导航'" style="width:200px;">
    	<div id="navigation" class="easyui-accordion" data-options="fit:true">   
		    
		    <div  title="基本操作" >   
		        <ul>
					<li><a href="#" title="send_category_query.action">类别管理 </a></li>
					<li><a href="#" title="send_product_query.action">商品管理 </a></li>
				</ul> 
		    </div>  
		     
		    <div title="销售管理">   
		        <ul>
					<li><a href="#" title="send_sale_sale.action">报表管理 </a></li>
				</ul> 
		    </div>   
		    <div title="系统管理">   
		        <ul>
					<li><a href="#" title="send_sale_sale.action">联系我们 </a></li>
				</ul>  
		    </div>   
		</div>  
    	
    </div>   
    <div data-options="region:'center',title:'E~Go商城显示'" style="padding:5px;background:#eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true">
			<div title="系统缺省页面">显示操作系统等基础信息</div>
		</div>
	<div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>
	</div>   
</body>  
</html>
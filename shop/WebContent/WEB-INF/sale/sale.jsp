<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/public/head.jspf" %>
	<script type="text/javascript" src="${shop}/js/jscharts.js"></script>
	<script type="text/javascript" src="${shop}/js/jquery-1.9.1.js"></script>
	
	<script type="text/javascript">
		function query(){
			var colorArr = ['#00CC66','#8BCEC0','#AEEEEE','#4EEE94','#8EE5EE','#7CFC00','#836FFF','#3E90C9','#0000FF','#00CC66']
			// 发送Ajax请求
			$.post($("#sale").val(),{number:$("#number").val()},function(data){
				var myChart = new JSChart('chart_container', $("#type").val(), '');
				myChart.setDataArray(data);
				myChart.colorize(colorArr.slice(0,data.length));
				myChart.setSize(600, 300);
				myChart.setIntervalEndY(10);
				myChart.setTitle('商品销售报表');
				myChart.setTitleFontSize(10);
				myChart.setBarSpacingRatio(50);
				myChart.setBarOpacity(1);
				myChart.setAxisWidth(1);
				myChart.setAxisNameX('商品名称', '商品名称');
				myChart.setAxisNameY('销量', '销量');
				myChart.set3D(true);
				myChart.setBarValues(false);
				myChart.draw();
			},"JSON");
		}
	</script>
</head>
<body>
请选择报表类型：<select id="sale"><option value="sorder_querySale.action">年度销售报表</option></select>
查询数量：<select id="number">
	   	<option value="5">5</option>
	   	<option value="7">7</option>
	   	<option value="10">10</option>
	   </select>
报表类型：<select id="type">
			<option value="bar">柱状图</option>
			<option value="line">线性图</option>
			<option value="pie">饼状图</option>
	  </select>
<button id="sub" onclick="query()">查询 </button>
<div style="margin-left: 20px" id="chart_container">表格加载中...</div>
</body>
</html>
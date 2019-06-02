<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/public/head.jspf" %>
	<style type="text/css">
		body{
			margin: 3px;
		}
		.searchbox {
			  margin: -3;
			}
	</style>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({    
			    url:'product_queryJoinCategory.action',
			    queryParams:{name:''},
			    // 指明哪一个字段是标识字段。
			    idField:'id',
			    fitColumns:true,
			    striped:true,
			    striped:true,
			    pagination:true,
			    toolbar: [{
					iconCls: 'icon-add',
					text:'新增商品',
					handler: function(){
						parent.$('#win').window({    
							title:'新增商品',
						    width:500,    
						    height:520,    
						    modal:true,  
							content:'<iframe frameborder="0" width="100%" height="100%" src="send_product_save.action"/>'
						});  
												
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'更新商品',
					handler: function(){
						var rows = $("#dg").datagrid('getSelections');
						// 返回被选中的函数  未选中返回空数组
						if(rows.length != 1){
								//弹出提示框
							 $.messager.show({
								title:'错误提示',
								msg:'请选择一条数据数据进行操作！',
								timeout:3000,
								showType:'slide'
							});
						}else{
							parent.$('#win').window({    
								title:'更新商品',
							    width:550,    
							    height:500,    
							    modal:true,  
								content:'<iframe frameborder="0" width="100%" height="100%" src="send_product_update.action"/>'
							});
							
						}
					}
				},'-',{
					iconCls: 'icon-cut',
					text:'删除商品',
					handler: function(){
						var rows = $("#dg").datagrid('getSelections');
						// 返回被选中的函数  未选中返回空数组
						if(rows.length == 0){
								//弹出提示框
							 $.messager.show({
								title:'错误提示',
								msg:'请至少选择一条数据！',
								timeout:3000,
								showType:'slide'
							});
						}else{
							// 删除逻辑操作
							$.messager.confirm('删除操作','您确认想要删除选中的记录吗？',function(r){    
							    if (r){  
								    // 1 获得选中行数的id 并拼接
									var ids ="";
									for(var i =0;i<rows.length;i++){
										ids += rows[i].id+",";
									}
									ids = ids.substring(0,ids.lastIndexOf(","));
									// 发送ajax请求
									 $.post("product_deleteByIds.action",{ids:ids},function(result){
											if(result == 'true'){
												//取消选中的所有行
												$("#dg").datagrid("uncheckAll");
												// 刷新页面
												$("#dg").datagrid("reload");
											}else{
												$.messager.show({
													title:'错误提示',
													msg:'删除失败，请重新选择操作！',
													timeout:3000,
													showType:'slide'
												});
											}
										},"text"); 
							    }    
							});  
						}
					}
				},'-',{
					text:"<input type='text' id='ss' name='search' />"
				}],
			    frozenColumns:[[
			    	{field:'ck',checkbox:true},
			        {field:'id',title:'商品编号',width:100}    
				    ]], 
			    columns:[[
			    	{field:'pic',title:'商品图片',width:300,
				        formatter: function(value,row,index){
					        if(row.pic!=null){
								return "<img style='width:50px;height:50px;' border='1' src='image/"+row.pic+"'/>";
					    }else{
								return "本商品暂无图片，点击上传"
							}
					}},    
			        {field:'name',title:'商品名称',width:300,
				        formatter: function(value,row,index){
							return "<span title="+value+">"+value+"</span>";
					}},
					{field:'price',title:'商品价格',width:300,
				        formatter: function(value,row,index){
							return "￥"+row.price;
					}},    
					{field:'remark',title:'简单介绍',width:300,
				        formatter: function(value,row,index){
							return "<span title="+value+">"+value+"</span>";
					}},{
					field : 'account.login',
					title : '类别名称',
					width : 100,
					formatter : function(value, row, index) {
						if (row.category != null && row.category.type != null) {
							return row.category.type;
						} else {
							return "类别缺失"
						}
					}
				} ] ]
			});

			$('#ss').searchbox({ 
				searcher:function(value,name){ 
					$("#dg").datagrid('load',{name:value})
				}, 
				menu:'#mm', 
				prompt:'请输入关键字' 
				}); 
							
		});
	</script>
	
</head>
<body>
	<table id="dg"></table>
</body>
</html>
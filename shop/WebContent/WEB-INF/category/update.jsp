<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/public/head.jspf" %>
	<style type="text/css">
		form div{
			margin: 10px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			var dg = parent.$("iframe[title='类别管理']")[0].contentWindow.$("#dg");
			var rows = dg.datagrid("getSelections");
			//数据回显
			$('#cc').combobox({    
			    url:'account_query.action',    
			    valueField:'id',    
			    textField:'login',
			    panelHeight:'auto',
			    editable:false  
			}); 
			
			$('#ff').form('load',{
				id:rows[0].id,
				type:rows[0].type,
				hot:rows[0].hot,
				'account.id': rows[0].id
			});

			// 开启验证
			$("input[name='type']").validatebox({    
			    required: true,
			    missingMessage:'请输入类别名称！'    
			});
			//禁用验证
			$("#ff").form("disableValidation") ;

			$("#btn").click(function(){
				// 开启验证
				$("#ff").form("enableValidation");
				// 判断参数是否正确
				if($("#ff").form("validate")){
					// 验证通过，提交数据
					$('#ff').form('submit', {
						url:'category_update.action',
						success: function(){
							// 如果提交成功则关闭窗口
							parent.$("#win").window("close");
							// 刷新页面
							dg.datagrid("reload");
						}
					});
										
				}
					
			});
		});
	</script>
</head>
<body>
	<form title="添加商品" id="ff" method="post" enctype="multipart/form-data">
	<div>
		<label for="type">类别名称:</label><input type="text" name="type" class="easyui-valiatebox"/> 
	</div>
	<div>
		<label for="hot">热点:</label><input type="radio" name="hot" value="true"/>
		<label for="hot">非热点:</label><input type="radio" name="hot" value="false"/>
	</div>
	<div>
		<label for="account">所属管理员:</label>
		<!-- 远程加载管理员数据 -->
		<input id="cc" name="account.id">  
	</div>
	<div>
		<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls: 'icon-add'">更新类别</a>
		<input type="hidden" id="id" name="id">         
	</div>
</form>
</body>
</html>
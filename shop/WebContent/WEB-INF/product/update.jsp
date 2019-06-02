<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 引入公共的JSP片段 -->
	<%@include file="/public/head.jspf" %>
	<style type="text/css">
		form div{
			margin: 10px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$.extend($.fn.validatebox.defaults.rules, {    
				// 函数的名称， 函数的实现体
			    format: {    
			        validator: function(value,param){    
						// 获取上传文件后缀名
						var ext = value.substring(value.lastIndexOf(".")+1);
						// 获取支持的后缀名，然后比较
						var arr = param[0].split(",");
						for(var i = 0;i<arr.length;i++){
							if(ext == arr[i]){
								return true;	
							}
						}
			            return false;    
			        }, 
			        // 错误信息   
			        message: '文件格式必须为：{0}'   
			    }    
			});  

			// 商品类别动态加载
			$('#cc').combobox({    
			    url:'category_query.action',    
			    valueField:'id',    
			    textField:'type',
			    panelHeight:'auto',
			    editable:false ,
			    required: true,
			    missingMessage:'请选择商品类别！'    
			});
			
			var dg = parent.$("iframe[title='商品管理']")[0].contentWindow.$("#dg");
			var rows = dg.datagrid("getSelections");
			
			// 数据回显
			$('#ff').form('load',{
				id:rows[0].id,
				name:rows[0].name,
				price:rows[0].price,
				remark:rows[0].remark,
				pic: "${shop}/image/"+rows[0].pic,
				xremark:rows[0].xremark,
				'category.id': rows[0].id
			});

			
			$("input[name='name']").validatebox({    
			    required: true,
			    missingMessage:'请输入商品名称！'    
			}); 

			$("input[name='price']").numberbox({    
			    required: true,
			    missingMessage:'请输入商品价格！',
			    min:0,    
			    precision:2,
			    prefix:'￥'      
			});

			$("input[name='fileImage.upload']").validatebox({ 
				required: true,
			    missingMessage:'请上传商品图片！',   
				validType:"format['gif,jpg,jpeg,png']"    
			});

			$("input[name='fileImage.file']").change(function(){
				$(this).validatebox	("validate");
			}); 

			$("textarea[name='remark']").validatebox({ 
				required: true,
			    missingMessage:'请输入商品简介！'   
			});
			
			$("textarea[name='xremark']").validatebox({ 
				required: true,
			    missingMessage:'请输入商品详细介绍！'   
			});

			//禁用验证
			$("#ff").form("disableValidation") ;

			
			$("#submit").click(function(){
				// 开启验证
				$("#ff").form("enableValidation");
				// 判断参数是否正确
				if($("#ff").form("validate")){
					// 验证通过，提交数据
					$('#ff').form('submit', {
						url:'product_update.action',
						success: function(){
							// 如果提交成功则关闭窗口
							parent.$("#win").window("close");
							// 刷新页面
							dg.datagrid("reload");
						}
					});
				}
			});


			$("#reset").click(function(){
				$("#ff").form("reset");
			});

		});
	</script>
</head>

<body>
<form title="添加商品" id="ff" method="post" enctype="multipart/form-data">
	<div>
		<label>商品名称:</label> <input type="text" name="name" />
	</div>
	<div>
		<label>商品价格:</label> <input type="text" name="price" />
	</div>
	<div>
		<label>图片上传:</label>
		<input type="image"  style='width:50px;height:50px;' border='1' name="pic" /><br/>
		<input type="file" name="fileImage.file" />
	</div>
	<div>
		<label>所属类别：</label> 
		<input id="cc" name="category.id"/>
	</div>
	<div>
		<label>加入推荐:</label> 推荐:<input type="radio" name="commend"
			checked="checked" value="true" />  不推荐:<input type="radio"
			name="commend" value="false" /> 
	</div>
	<div>
		<label>是否有效:</label>
		上架:<input type="radio" name="open" checked="checked"value="true" />
		下架:<input type="radio" name="open" value="false" />
				
	</div>
	<div>
		<label>简单描述:</label>
		<textarea name="remark" cols="40" rows="4"></textarea>
	</div>
	<div>
		<label>详细描述:</label>
		<textarea name="xremark" cols="40" rows="8"></textarea>
	</div>
	<div>
		<input type="hidden" id="id" name="id">
		<a id="submit" href="#" class="easyui-linkbutton">修 改</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
	</div>
</form>
</body>
</html>

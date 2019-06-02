<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/public/head.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>面部扫描登录</title>
<style type="text/css">
	*{margin: 0;padding: 0;}
	html,body{width: 100%;height: 100%;}
	
	#poster_img{
		width: 100%;
		height: 400px;
		position: absolute;
		background: transparent no-repeat;
        background-size:cover;
	}
	#btn{
		margin-left: 765px;
		margin-top: 4px;  
		width: 200px;
		height: 38px;
		line-height:38px;
		background-color: #00BFFF;
		text-align: center;
		border-radius: 10px;
		cursor:pointer;
	}
</style>
</head>
<body style="background-image: url(${shop}/image/bg.jpg);>	
		<div align="center">      
		<div id="poster_img"></div>     
			<video src="" id="video" autoplay="" width="534px" height="400px" style="margin-left: 600px;margin-top: 105px;border-radius: 50%"> </video>
			<canvas id="canvas" width="534px" height="400px" style="display: none;"></canvas>
			<div id= "btn">点击登录</div>
		</div>
		
		<script type="text/javascript">
			/* 调用摄像头 */
			var getUserMedia = (navigator.getUserMedia);
			getUserMedia.call(navigator,{video:true},onsuccess,onerror);
			function onsuccess(localMediaStream) {
				var Ovideo = document.getElementById("video");
				Ovideo.srcObject = localMediaStream;
				Ovideo.play();
			}
			function onerror(e) {
				console.log(e);
			}
			
			document.getElementById("btn").onclick = function(){
				// 获取面部信息，即照片一张
				var canvas = document.getElementById("canvas");
				var context = canvas.getContext('2d');
				context.drawImage(video,0,0,534,400);
				var imgSrc = canvas.toDataURL('image/png');
				var face =imgSrc.split(",")[1];
				$.ajax({
					url:"houtai_login.action",
					type:"post",
					data:{
						"face":face,
						"image_type": "BASE64",
				        "face_type": "LIVE",
				        "quality_control": "LOW",
				        "liveness_control": "HIGH"	
					},
					success:function(res){
						if(res.score >=80 ){
						 	toastr.success("识别成功！");
						 	setTimeout(function(){
						 		location.href= "${shop}/send_main_index_main.action";
						 	},1000);
								
						}else{
							toastr.error("识别失败，换个角度会更美哦！");
						}
					}
				});
			}
		</script>
</body>
</html>
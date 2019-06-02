<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv=refresh content=3;url=http://localhost:8080/shop />
<style type=text/css>
.font14 {
	font-size: 14px
}	

.font12 {
	font-size: 12px
}

.font12 a {
	font-size: 12px;
	color: #CC0000;
	text-decoration: none;
}
</style>
</head>
<body>
	<table height=500 cellSpacing=0 cellPadding=0 width=500 align=center
		background="${shop}/shop/image/image.gif " border=0>
		<tbody>
			<tr>
				<td height=330></td>
			</tr>
			<tr>
				<td vAlign=top>
					<div class=font14 align=center>
						<strong>${exception.message}</strong><br />
						<font color=#666666>三秒后自动返回<a href="http://localhost:8080/shop">E~Go商城</a>首页........ 
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>

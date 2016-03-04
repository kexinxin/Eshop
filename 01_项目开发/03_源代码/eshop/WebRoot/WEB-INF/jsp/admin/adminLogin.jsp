<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E购管理系统</title>
<link rel="stylesheet" type="text/css" href="./css_js/adminLogin/ext-all.css">
<style type="text/css">
.style1 {
	FONT-WEIGHT: bold;
	FONT-SIZE: 13px;
	COLOR: #1c5ba2
}

.style2 {
	FONT-SIZE: 12px;
	FONT-FAMILY: Arial Unicode MS
}

.style3 {
	FONT-SIZE: 12px
}

.style4 {
	FONT-WEIGHT: bold;
	COLOR: #1c5ba2;
	FONT-FAMILY: Arial Unicode MS
}

.style6 {
	FONT-WEIGHT: bold;
	FONT-SIZE: 12px;
	COLOR: #1c5ba2;
	FONT-FAMILY: Arial Unicode MS
}

.style9 {
	FONT-SIZE: 10px;
	FONT-FAMILY: Arial Unicode MS
}

.logintext {
	font-family: Arial;
	font-size: 10pt;
	font-weight: bold;
}

.forgetpassword {
	font-family: Arial;
	font-size: 9pt;
	color: rgb(84, 141, 212);
	font-weight: bold;
	padding: 5px 0px 0px 0px;
}

.logincontrol {
	idth: 100%;
	height: 23px;
}

.productName {
	font-family: Arial;
	font-size: 7pt;
	font-weight: bold;
	color: white;
}

.adlogin {
	FONT-SIZE: 12px;
	COLOR: black;
	FONT-FAMILY: Arial Unicode MS
}

.nor-entry-label {
	font: 10pt arial;
	color: #6795C3;
	font-weight: bold;
	padding: 5px 5px 0px 0px;
}

body {
	background: #f9fafc url(css_js/adminLogin/bg.jpg) repeat-x;
	font-size: 12px;
	color: #333333
}

.logon_logo {
	background: url(css_js/adminLogin/login_logo.png) no-repeat;
	width: 337px;
	height: 90px;
}

.login_bg {
	background: url(css_js/adminLogin/login_bg.jpg);
	width: 710px;
	height: 230px;
}

.login {
	width: 235px;
	height: 140px;
	margin-left: 245px;
	margin-top: 45px;
}

input {
	vertical-align: middle;
}

.InputStyle {
	border: #CCCCCC 1px solid;
	width: 180px;
	height: 20px;
}

.bg_01 {
	width: 100%;
	height: 112px;
	margin-top: 16px;
	filter: progid:DXImageTransform.Microsoft.gradient(startcolorstr=#26a3ff,
		endcolorstr=#124490, gradientType=1);
	-ms-filter: progid:DXImageTransform.Microsoft.gradient(startcolorstr=#26a3ff,
		endcolorstr=#124490, gradientType=1);
	background: -moz-linear-gradient(left, #26a3ff, #124490); /*兼容火狐*/
	background: -webkit-gradient(linear, left top, right top, from(#26a3ff),
		to(#124490)); /*兼容chrome、Safari\360浏览器*/
	background: -o-linear-gradient(left, #26a3ff, #124490)); /*兼容Opera11*/
}

.bg_02 {
	width: 100%;
	height: 111px;
	margin-top: 17px;
	filter: progid:DXImageTransform.Microsoft.gradient(startcolorstr=#124490,
		endcolorstr=#26a3ff, gradientType=1) ； -ms-filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#124490,
		endcolorstr=#26a3ff, gradientType=1);
	background: -moz-linear-gradient(left, #124490, #26a3ff); /*兼容火狐*/
	background: -webkit-gradient(linear, left top, right top, from(#124490),
		to(#26a3ff)); /*兼容chrome、Safari\360浏览器*/
	background: -o-linear-gradient(left, #124490, #26a3ff)); /*兼容Opera11*/
}

.footer {
	line-height: 18px;
	color: #333333;
	height: 30px;
	font-size: 11
}
</style>
</head>
<body bgcolor="#ffffff" class="   ext-webkit ext-chrome">
	<form id="form1" name="form1"
		action="adminLogin"
		target="_top" method="post">
		<input type="hidden" name="forceSingle" value="true" id="forceSingle">
		<input type="hidden" name="falg" value="" id="falg">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td height="274">&nbsp;</td>
					<td class="logon_logo">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td valign="top"><div class="bg_01"></div></td>
					<td class="login_bg" width="710" style="margin-top:200px;"><table
							width="235" height="140" border="0" class="login" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td class="nor-entry-label">用户名:</td>
									<td><input type="text" name="username" value="" tabindex="1"
										id="userid" class="InputStyle"></td>
								</tr>
								<tr>
									<td class="nor-entry-label">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
									<td><input type="password" name="password" value=""
										tabindex="2" id="userpwd" class="InputStyle"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input name="bLogin" id="bLogin"
										onclick="document.form1.submit();return false;" class="logintext" type="image"
										src="./css_js/adminLogin/register.jpg" width="73" height="26"
										style="margin-right:20px;"> 
									<input name="uReset"
										id="uReset" onclick="document.form1.reset();return false;"
										type="image" src="./css_js/adminLogin/cancel.jpg" width="73"
										height="26">
									</td>
								</tr>
							</tbody>
						</table></td>
					<td valign="top"><div class="bg_02"></div></td>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>我买到的商品-买家中心-中关村商城</title>
<link href="./css_js/accountManage/public.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/accountManage/foot.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/accountManage/publicTips.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/accountManage/score.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/accountManage/ui.all.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" async="" charset="utf-8"
	src="./css_js/accountManage/zgc_member.js"></script>
<script src="./css_js/accountManage/bcore.min.js" type="text/javascript"></script>
<script src="./css_js/accountManage/P.do" charset="utf-8"></script>
<script src="./css_js/accountManage/PageView.do" charset="utf-8"></script>
<script src="./css_js/accountManage/DFeedBack.do" charset="utf-8"></script>
</head>
<body>
	<!-- 公用导航 start -->
	<!-- 公用导航 end -->
	<!-- header start-->
	<div class="header">
		<div class="wrapper clearfix">
			<a href="#" class="logo"></a>
		</div>
	</div>
	<!-- header end-->
	<div class="mainbody module clearfix">
		<!-- header end-->
		<div class="side">
			<h3>
				<a href="#">管理中心</a>
			</h3>
			<ul class="nav clearfix">
				<li><a href="viewAllAccount">账户管理</a></li>
				<li><a href="intoAdminOrderManage">订单管理</a></li>
				<li><a href="intoUpload_addProduct"> 商品添加 </a></li>
				<li class="current"><span>用户日志</span></li>
				<li><a href="intoStateChangeLog">订单日志 </a></li>
			</ul>
		</div>
		<div class="main">
			<div class="mainbg"></div>
			<div class="complaints-apply">
				<div class="apply-searchbox clearfix"></div>
				<!-- order_list -->
				<table class="order-list-nav">
					<table class="attention-nav">
						<tr>
							
							<td class="cell-1" style="width:120px;">Id</td>
							<td class="cell-2" style="width:183px;">用户名</td>
							<td class="cell-3" style="width:172px;">事件</td>
							<!--                            <td class="cell-4">关注人气</td>-->
							<td class="cell-4" style="width:172px;">时间</td>
							<td class="cell-6" style="width:102px;">操作</td>
						
						</tr>
					</table>
				
					<!-- 关注的商家内容 -->
					<div class="attention-box">
						<ul class="attention-list">
						<s:iterator value="logList" >
							<li>
								<div class="attention-inner clearfix">
									<div class="infor" style="width:200px;">
										<s:property
								value="logId" />
									</div>
									<div class="infor" style="width:173px;">
										<s:property
								value="username" />
									</div>
									<div class="sales" style="width:102px;"><s:property
								value="event" /></div>
									<div class="time" style="width:172px;"><s:property
								value="time" /></div>
								<div class="operate" style="width:152px;">
										
									</div>
									
									
								</div>
							</li>
						</s:iterator>
					
		<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							
						</ul>
						</table>
					</div>
					<!-- 关注的商家内容 end-->

					<!-- order_list end-->
					<div class="page-num">
						<span class="sel">1</span>
					</div>
					<!-- 猜您喜欢 photo-list -->
					<div class="photobox mt20" id="zp-goods-recommend" style="">
						<div class="photo-tab"></div>
					</div>
					<!-- 猜您喜欢 photo-list -->
			</div>
		</div>
	</div>
</body>
</html>
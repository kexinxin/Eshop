<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>我买到的商品-买家中心-中关村商城</title>
<link href="./css_js/adminOrderManage/public.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/adminOrderManages/foot.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/adminOrderManage/publicTips.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/adminOrderManage/score.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/adminOrderManage/ui.all.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" async="" charset="utf-8"
	src="./css_js/adminOrderManage/zgc_member.js"></script>
<script src="./css_js/adminOrderManage/bcore.min.js"
	type="text/javascript"></script>
<script src="./css_js/adminOrderManage/P.do" charset="utf-8"></script>
<script src="./css_js/adminOrderManage/PageView.do" charset="utf-8"></script>
<script src="./css_js/adminOrderManage/DFeedBack.do" charset="utf-8"></script>
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
				<li class="current"><span>订单管理</span></li>
				<li><a href="intoUpload_addProduct"> 商品添加 </a></li>
				<li><a href="intoCustomerLog">用户日志</a></li>
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
							<td class="cell-1" style="width:163px;">订单编号</td>
							<td class="cell-2" style="width:120px;">用户名</td>
							<td class="cell-3" style="width:183px;">总额</td>
							<td class="cell-5" style="width:172px;">订单状态</td>
							<td class="cell-6" style="width:102px;">操作</td>
						</tr>
					</table>
					<!-- 关注的商家内容 -->
					<div class="attention-box">
						<ul class="attention-list">


							<s:iterator value="orderList">
								<li>
									<div class="attention-inner clearfix">
										<div class="infor" style="width:190px;">
											<a href="viewOrderInfo?orderId=<s:property value="orderId" />" target="_blank" title="正品数码特惠店"><s:property
													value="orderId" /></a>
										</div>
										<div class="sales" style="width:120px;">
											<s:property value="username" />
											
										</div>
										<div class="time" style="width:183px;">
											<s:property value="totalPrice" />
										</div>
										<!--                                                <div class="popularity">2</div>-->
										<div class="recommend" style="width:172px;">
											<s:if test='orderstateId==3'>
									未发货
							</s:if>
											<s:if test='orderstateId==1'>
									未支付
								</s:if>
											<s:if test='orderstateId==4'>
									已发货
								</s:if>
											<s:if test='orderstateId==7'>
									未评价
								</s:if>
											<s:if test='orderstateId==8'>

                                                                                                                               已评价
								</s:if>
										</div>
										<div class="operate" style="width:102px;">


											<s:if test='orderstateId==3'>
												<a href="diliverProduct?orderId=<s:property value="orderId" />" fn="delFollowMerchant"
													merchantId="189963" class="btn4">发货</a>
											</s:if>
											<s:if test='orderstateId==1'>
												<a href="delectOrder?orderId=<s:property value="orderId" />" fn="delFollowMerchant"
													merchantId="189963" class="btn4">删除</a>
											</s:if>
											<s:if test='orderstateId==4'>
												<a href="viewOrderInfo?orderId=<s:property value="orderId" />" fn="delFollowMerchant"
													merchantId="189963" class="btn4">查看</a>
											</s:if>
											<s:if test='orderstateId==7'>
												<a href="viewOrderInfo?orderId=<s:property value="orderId" />" fn="delFollowMerchant"
													merchantId="189963" class="btn4">查看</a>
											</s:if>
											<s:if test='orderstateId==8'>
											<a href="viewOrderInfo?orderId=<s:property value="orderId" />" fn="delFollowMerchant"
													merchantId="189963" class="btn4">查看</a>
											</s:if>
									</div>
									</div>
									<div class="photo-list" style="display:none">
										<div class="photo-content">
											<ul class="clearfix" style="width:10000px;left:0;" step="4"
												totalPage="" nowPage="1" merchantId="189963">

											</ul>
										</div>
										<a href="javascript:void(0)" class="photo-prev">上一组</a> <a
											href="javascript:void(0)" class="photo-next">下一组</a>
									</div>
								</li>
							</s:iterator>
						</ul>
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
					</div>
					<!-- 猜您喜欢 photo-list -->
					</div>
					</div>
					</div>
					</div>
</body>
</html>
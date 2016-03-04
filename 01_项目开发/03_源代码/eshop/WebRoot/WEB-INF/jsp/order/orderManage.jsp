<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://my.zol.com/index.php?c=OrderManage -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>我买到的商品-买家中心-中关村商城</title>
<link href="./css_js/orderManage/public.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/orderManage/foot.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/orderManage/publicTips.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/orderManage/score.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/orderManage/ui.all.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<!-- 公用导航 start -->
	<%@ include file="../common/IncludeTop.jsp"%>
	<!-- 公用导航 end -->
	<!-- header start-->
	<div class="header">
		<div class="wrapper clearfix">
			<a href="viewMyAccount" class="logo"></a>
			<div class="searchbox">
				<form action="searchProductList" method="GET" ">
					<div class="searchmod">
						<input name="c" type="hidden" value="List"> <input
							name="keyword" type="text" class="searchtext"
							placeholder="搜索商品/店铺" maxlength="50" autocomplete="off">
						<ul style="display:none;"></ul>
					</div>
					<input name="do_search" type="submit" value="搜索" class="searchbtn">
				</form>
			</div>
		</div>
	</div>
	<!-- header end-->
	<div class="mainbody module clearfix">
		<!-- header end-->
		<div class="side">
			<h3>
				<a href="viewMyAccount">买家中心</a>
			</h3>
			<ul class="nav clearfix">

				<li class="current"><span>订单管理</span></li>
				<li><a href="viewMySaveItem"> 我的关注 </a></li>
				<li><a href="viewMyAccount">个人设置</a></li>
			</ul>
		</div>
		<div class="main">
			<div class="mainbg"></div>
			<div class="complaints-apply">
				<div class="apply-searchbox clearfix"></div>
				<!-- order_list -->
				<table class="order-list-nav">
					<tbody>
						<tr>
							<td class="cell-1">商品信息</td>
							<td class="cell-2">单价(元)</td>
							<td class="cell-3">数量</td>
							<td class="cell-4"></td>
							<td class="cell-5">实付款（元）</td>
							<td class="cell-6">状态</td>
							<td class="cell-7">操作</td>
						</tr>
					</tbody>
				</table>



				<s:iterator value="orderList">
					<div class="order-infor mt">
						<span>订单编号：<s:property value="orderId" /></span> <span>下单时间：<s:property
								value="createTime" /></span>

					</div>
					<table class="order-list" border="0" cellspacing="0"
						cellpadding="0">
						<tbody>

							<tr>
								<td><s:iterator value="orderItemList">
										<div class="product-infor">
											<div class="subproduct first clearfix">
												<a class="pic" href="#" "><img height="60"
													width="80" src="<s:property value="product.picture" />"></a>
												<div class="infor">
													<h3>
														<a href="#" "><s:property
																value="product.name" /></a>
													</h3>
													<div class="indemnity clearfix"></div>
													<p>
														<span class="color">颜色：<em>白色行货8GB</em></span><span
															class="setdoll">套装：<em>官方标配</em></span>
													</p>
												</div>
												<div class="price">
													<s:property value="product.sellPrice" />
												</div>
												<div class="num">
													<s:property value="amount" />
												</div>
												<div class="aftermarket"></div>
											</div>
										</div>
									</s:iterator></td>
								<td class="sum">
									<p class="order-price">
										<s:property value="tatalPrice" />
									</p>
									<p class="send-price">（免运费）</p>
								</td>
								<s:if test='orderstateId==3'>


									<td class="status">
										<p class="red" style="color:#FF5500">等待卖家发货</p>
										<p>
											<a class="btn" href="#">催卖家发货</a>
										</p>
									</td>
								</s:if>
								<s:if test='orderstateId==1'>


									<td class="status">
										<p class="red" style="color:#FF5500">请支付商品</p>
										<p>
											<a " class="btn"
												href="rePayOrder?orderId=<s:property value="orderId" />">支付商品</a>
										</p>
									</td>
								</s:if>
								<s:if test='orderstateId==4'>


									<td class="status">
										<p class="red" style="color:#FF5500">已发货</p>
										<p>
											<a " class="btn" href="confirmReceive?orderId=<s:property value="orderId" />">确认收货</a>
										</p>
									</td>
								</s:if>
								<s:if test='orderstateId==7'>


									<td class="status">
										<p class="red" style="color:#FF5500">未评价</p>
										<p>
											<a " class="btn" href="intoValuationList?orderId=<s:property value="orderId" />">评价商品</a>
										</p>
									</td>
								</s:if>
								<s:if test='orderstateId==8'>


									<td class="status">
										<p class="red" style="color:#FF5500">已评价</p>
									</td>
								</s:if>
								<td class="operate">
									<p>
										<a href="viewOrderInfo?orderId=<s:property value="orderId" />">订单详情</a>
									</p>


								</td>
							</tr>
						</tbody>
					</table>


				</s:iterator>
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
</body>
</html>
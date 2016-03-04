<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!-- saved from url=(0054)http://order.zol.com/index.php?c=ConfirmOrder&a=BuyNow -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gbk">
<title>订单确认页 － ZOL商城｜中关村在线旗下网上商城</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link href="css_js/orderConfirm/orderPublic_v1.css" rel="stylesheet"
	type="text/css">
<link href="css_js/orderConfirm/order_v2.css" rel="stylesheet"
	type="text/css">
<style>
/*提示 弹出层 prompt*/
.layerbox-head .layerbox-close,.layerbox-button-true,.layerbox-button-false,.layerbox-body .wrong-tip
	{
	background: url(http://icon.zol-img.com.cn/newshop/shop/pop-ico.png)
		no-repeat;
}
</style>
</head>
<body>
	<!-- topbar -->
	<link href="css_js/orderConfirm/publicHead.css" rel="stylesheet"
		type="text/css">
	<%@ include file="../common/IncludeTop.jsp"%>
	<!-- //topbar -->
	<!-- header -->
	<div class="header clearfix">
		<!--logo样式 -->
		<div class="logo">
			<a href="http://www.zol.com/" title="中关村商城"> <img
				src="css_js/orderConfirm/shop_212x40.jpg" width="212" height="40">
			</a>
		</div>
		<div class="flow-step">
			<ul class="flow-step-5">
			    <li class="s1">加入购物车</li>
				<li class="s2">下订单</li>
				<li class="s3">去付款</li>
				<li class="s4">确认收货</li>
				<li class="s5">评价</li>
			</ul>
		</div>
	</div>
	<!-- //header -->
	<div class="wrapper">
		<form action="insertToDB?orderItemId=<s:property	value="orderItem.orderItemId" />" name="confirmOrder" id="confirmOrder" method="post">



			<div class="container">
				<div class="container-hd">
					<div class="title">评价订单</div>
				</div>
				<div class="goods-list">
					<!-- 单个商品信息 -->
					<input name="payType-188530" rel="1" id="payType-188530"
						type="hidden" value="2"> <input type="hidden"
						name="merchantId" value="188530"> <input type="hidden"
						name="fromMerchantId" value="188530"> <input type="hidden"
						name="goodsId" value="25241783"> <input type="hidden"
						name="suitId" value="3976573"> <input type="hidden"
						name="goodsNumber" value="1"> <input type="hidden"
						name="buyType" value="1"> <input type="hidden"
						name="shareId" value="0"> <input type="hidden"
						name="phoneToken" value=""> <input type="hidden"
						name="isContract" value="0"> <input type="hidden"
						name="contractTypeId" value="0">
					<!-- -->
					<table>
						<tbody>
							<tr>
								<th class="cell-1"></th>
								<th class="cell-2">单价（元）</th>
								<th class="cell-3">数量</th>
								<th class="cell-4">商品优惠</th>
								<th class="cell-5">小计</th>
							</tr>




							<tr>
								<td class="cell-1">
									<div class="goods-infor">
										<a
											href="http://www.zol.com/detail/cell_phone/meizu/25241783.html"
											class="pic"><span><img width="60" height="60"
												src="<s:property value="orderItem.product.picture" />"
												alt=<s:property value="orderItem.product.name" />></span></a> <span
											class="title"><a
											href="http://www.zol.com/detail/cell_phone/meizu/25241783.html"
											target="_blank"><s:property
													value="orderItem.product.name" /></a></span>
										<div class="color-suits">
											<dl class="color">
												<dt class="label">颜色：</dt>
												<dd>白色厂商指导价16GB</dd>
											</dl>
											<dl class="suits" id="suit-details-3976573" fn="3976573">
												<dt class="label">套装：</dt>
												<dd>
													<span>官方标配</span>
													<div class="suit-details">
														<i class="ico"></i>
														<p>套装详情：</p>
														<p>行货带票：16G版白色879元/蓝色/粉色899元/灰色909元【送保护壳】</p>
													</div>
												</dd>
											</dl>
										</div>
									</div>
								</td>
								<td class="cell-2"><s:property value="orderItem.product.sellPrice" /></td>
								<td class="cell-3"><s:property value="orderItem.amount" /></td>
								<td class="cell-4">
									<div class="preferential-goods">
										无
										<div class="detail" style="display:none;">
											<i class="ico"></i>


										</div>
									</div>
								</td>
								<td class="cell-5"><s:property value="orderItem.attr2" /></td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="order-extra">
										<div class="message-box">
											<span class="label">评价：</span>
											<textarea class="text-focus"
												name="valuation"
												id="orderNote" fn="limit" limit="200" tipsid="haveFonts"
												style="color:#999999;">您可以填写对商品的评价</textarea>
											<span class="words-num">还可以输入<span id="haveFonts">200</span>字
											</span>
										</div>
									</div>

								</td>
							</tr>






						</tbody>
					</table>
				</div>
			</div>
			<!-- //购物车商品信息 -->

			<!-- 提交订单 -->
			<div class="submit-order clearfix">
				<div class="total-price clearfix">
					<span>谢谢你的评价 </span>
				</div>
			</div>


			<div class="clearfix">
				<input class="submit-btn"  name="confirmOrder"
					type="submit" onclick="$.orderSubmit()" value="提交订单">
				<div class="fail-submit" style="display:none; cursor:not-allowed"
					title="填写错误，不能提交订单">不能提交订单</div>
			</div>
		</form>
		<!-- //提交订单 -->
	</div>
	<!-- 公共底部 -->
	<div class="footer"></div>
</body>
</html>









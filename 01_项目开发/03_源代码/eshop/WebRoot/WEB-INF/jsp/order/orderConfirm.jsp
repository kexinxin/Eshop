<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!-- saved from url=(0054)http://order.zol.com/index.php?c=ConfirmOrder&a=BuyNow -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gbk">
<title>订单确认页</title>
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

.layerbox-border {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 370px;
	height: 204px;
	margin: -107px 0 0 -190px;
	border: 5px solid #b2b2b2;
	z-index: 1001;
	display: none
}

.layerbox-content {
	background: #fff;
}

.layerbox-head {
	height: 37px;
	padding: 0 10px;
	line-height: 37px;
	border-bottom: 1px solid #e6e6e6;
	background: #f3f3f3;
	overflow: hidden;
	zoom: 1;
}

.layerbox-title {
	padding: 0 0 0 5px;
	font-size: 14px;
	line-height: 37px;
}

.layerbox-subtitle {
	font-size: 12px;
	color: #666;
	font-family: simsun;
	font-weight: normal;
}

.layerbox-head .layerbox-close {
	position: absolute;
	width: 21px;
	height: 21px;
	top: 8px;
	right: 10px;
	background-position: -90px 5px;
	cursor: pointer;
	_baclground-position: -120px -85px;
	overflow: hidden;
	font: 0/0 arial;
}

.layerbox-head .layerbox-close:hover {
	background-position: -90px -17px;
}

.layerbox-body {
	padding: 30px 16px 0;
	zoom: 1;
}

.layerbox-body p {
	font-size: 14px;
	line-height: 20px;
}

.layerbox-body p em {
	color: #36c;
}

.layerbox-body .layer-check {
	position: relative;
	height: 18px;
	margin: 9px 0 0;
	padding: 0 0 0 18px;
	color: #666;
}

.layerbox-body .layer-check input {
	position: absolute;
	top: 3px;
	left: 0;
	*top: 0;
	*left: -3px;
}

.layerbox-body .wrong-tip {
	visibility: hidden;
	height: 18px;
	margin: 2px 0 0;
	padding: 0 0 0 18px;
	color: #f00;
	background-position: -97px -47px;
}

.layerbox-button-true {
	display: inline-block;
	width: 80px;
	height: 30px;
	color: #fff;
	line-height: 30px;
	text-align: center;
	background-position: 0 0;
}

.layerbox-button-true:hover {
	background-position: 0 -35px;
	color: #fff;
	text-decoration: none;
}

.layerbox-button-false {
	display: inline-block;
	margin: 0 0 0 10px;
	width: 80px;
	height: 30px;
	color: #333;
	line-height: 30px;
	text-align: center;
	background-position: 0 -70px;
}

.layerbox-button-false:hover {
	color: #333;
	text-decoration: none;
	background-position: 0 -105px;
}

.layerbox-foot {
	padding: 15px 16px 20px;
	font-family: simsun;
	line-height: 28px;
}

.layerbox-foot .more-info {
	float: right;
}

.layerbox-footleft {
	text-align: left;
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
			<a href="main" title="中关村商城"> <img
				src="css_js/orderConfirm/shop_212x40.jpg" width="212" height="40">
			</a>
		</div>
		<div class="flow-step">
			<ul class="flow-step-2">
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
		<form action="payOrder" name="confirmOrder" id="confirmOrder"
			method="post">

			<!-- 收货人信息 -->
			<div class="container consignee">
				<div class="container-hd">
					<a href="#" class="links">管理收货地址</a>
					<div class="title">收货地址</div>
				</div>
				<ul class="address-list">
					<li class="add-edits "><label>
							<div class="infor-editor editBox " id="infor-editor">
								<dl>
									<dt>
										<em class="xh">*</em>收货人：
									</dt>
									<dd>
										<input name="order.attr1" id="deliverName" type="text"
											value="" class="text recinput" maxlength="10"> <span
											class="wrong-tips none" id="deliverNameTips">请填写收货人</span>
									</dd>
								</dl>
								<dl class="area">
									<dt>
										<em class="xh">*</em>所在地区：
									</dt>
									<dd class="clearfix">
										<select onchange="$.getCityInfo()" name="provinceId"
											id="deliverProvinceId">
											<option value="">省/市</option>
											<option value="1">北京</option>
											<option value="2">上海</option>
											<option value="3">天津</option>
											<option value="4">重庆</option>
											<option value="5">黑龙江</option>
											<option value="6">辽宁</option>
											<option value="7">吉林</option>
											<option value="8">河北</option>
											<option value="9">内蒙</option>
											<option value="10">陕西</option>
											<option value="11">山西</option>
											<option value="12">甘肃</option>
											<option value="13">宁夏</option>
											<option value="14">新疆</option>
											<option value="15">西藏</option>
											<option value="16">青海</option>
											<option value="17">四川</option>
											<option value="18">云南</option>
											<option value="19">贵州</option>
											<option value="20">湖南</option>
											<option value="21">湖北</option>
											<option value="22">河南</option>
											<option value="23">山东</option>
											<option value="24">安徽</option>
											<option value="25">江苏</option>
											<option value="26">浙江</option>
											<option value="30">广东</option>
											<option value="31">广西</option>
											<option value="32">江西</option>
											<option value="33">福建</option>
											<option value="34">海南</option>
											<option value="150">其它</option>
										</select> <span class="wrong-tips none" id="deliverAreaTips">请选择地区</span>
									</dd>
								</dl>
								<dl class="detailed-address">
									<dt>
										<em class="xh">*</em>详细地址：
									</dt>
									<dd>
										<input name="order.address" id="deliverAddress" type="text"
											value="" class="text addinput" maxlength="30"> <span
											class="wrong-tips none" id="deliverAddressTips">请填写详细地址，5~30字</span>
									</dd>
								</dl>
								<div class="number clearfix">
									<dl>
										<dt>
											<em class="xh">*</em>手机号码：
										</dt>
										<dd>
											<input name="order.mobile" id="deliverMobile" type="text"
												value="" class="text" maxlength="11"> <em
												class="tips">或</em>
										</dd>
									</dl>
									<dl class="fixed-line">
										<dt>固定电话：</dt>
										<dd>
											<input name="tel" id="deliverPhone" type="text" value=""
												class="text" maxlength="17"> <em class="tips"
												id="deliverMobilePhoneTips" style="line-height:25px">手机号码和固定电话请至少输入一个</em>
										</dd>
									</dl>
								</div>

							</div></li>
				</ul>

			</div>
			<!-- //收货人信息 -->
			<!-- 支付方式 -->
			<div class="container">
				<div class="container-hd">
					<div class="title">支付方式</div>
				</div>
				<ul class="method-payment clearfix">
					<li class="current" value="2">网上支付 <i class="ico"></i>
					</li>
				</ul>
			</div>
			<!-- //支付方式 -->
			<!-- 购物车商品信息 -->
			<div class="container">
				<div class="container-hd">
					<div class="title">确认订单信息</div>
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




							<s:iterator value="car.cartItemList">
								<tr>
									<td class="cell-1">
										<div class="goods-infor">
											<a
												href="http://www.zol.com/detail/cell_phone/meizu/25241783.html"
												class="pic"><span><img width="60" height="60"
													src="<s:property value="product.picture" />"
													alt=<s:property value="product.name" />></span></a> <span
												class="title"><a
												href="http://www.zol.com/detail/cell_phone/meizu/25241783.html"
												target="_blank"><s:property value="product.name" /></a></span>
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
									<td class="cell-2"><s:property value="product.sellPrice" /></td>
									<td class="cell-3"><s:property value="quantity" /></td>
									<td class="cell-4">
										<div class="preferential-goods">
											<span>无</span>
											
										</div>
									</td>
									<td class="cell-5"><s:property value="total" /></td>
								</tr>
							</s:iterator>






							<tr>

							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //购物车商品信息 -->

			<!-- 提交订单 -->
			<div class="submit-order clearfix">
				<div class="total-price clearfix">
					<span class="price">实付额（含运费）：<em><s:property
								value="car.totalMoney" /></em></span> <span>商家承诺支付货款后<em>24小时</em>内发货
					</span>
				</div>
			</div>
			<div class="container consignee">
				<div class="container-hd">
					<div class="title">积分选择</div>
				</div>

				<select name="integrate" id="integrate">
					<option value="0">0</option>
					<option value="1">50</option>
					<option value="2">100</option>
					<option value="3">200</option>
				</select>
					说明50积分可以抵1元，100积分可以抵3元，200积分可以抵10元。每消费100元可以送1个积分。
					如果积分不够，还是返回这个页面

			</div>

			<div class="clearfix">
				<input class="submit-btn"  name="confirmOrder" type="submit" value="提交订单" />
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
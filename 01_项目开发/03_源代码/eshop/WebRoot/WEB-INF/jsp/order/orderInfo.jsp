<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gbk">
<title>订单详情页-E购商城</title>
<link href="./css_js/orderInfo/orderPublic_v1.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/orderInfo/cart_v1.css" rel="stylesheet"
	type="text/css">
<script src="./css_js/orderInfo/jquery-1.8.1.js"></script>
<img border="0" width="1" height="1"
	src="./css_js/orderInfo/pvhit0001.gif" style="display: none;">
<img border="0" width="1" height="1"
	src="./css_js/orderInfo/pvhit0001(1).gif" style="display: none;">
</head>
<body>
	 <%@ include file="../common/IncludeTop.jsp"%>
	<img border="0" width="1" height="1"
		src="./css_js/orderInfo/pvhit0001(2).gif" style="display: none;">
	<script src="./css_js/orderInfo/ptc.ht" type="text/javascript"></script>
	<script src="./css_js/orderInfo/ptc(1).ht" type="text/javascript"></script>

	<script src="./css_js/orderInfo/index.php"></script>
	<link href="./css_js/orderInfo/publicHead.css" rel="stylesheet"
		type="text/css">

	<link href="./css_js/orderInfo/publicHead(1).css" rel="stylesheet"
		type="text/css">


	<link href="./css_js/orderInfo/publicHead(2).css" rel="stylesheet"
		type="text/css">

	<div class="header clearfix">
		<!--logo样式 -->
		<div class="logo">
			<a href="main" title="中关村商城"><img
				src="./css_js/orderInfo/shop_212x40.jpg" width="212" height="40"></a>
			<!--script src="http://icon.zol-img.com.cn/zol_shop/js/public/logo.com.zol.js"></script-->
		</div>
		<div class="flow-step"></div>
	</div>

	<div class="wrapper">
		<div class="codmod orderinfor mt20">
			<!--<a href="#" class="cancelbtn">取消订单</a>-->
			<dl class="amount clearfix">
				<dt>订单状态：</dt>
				<dd>
					<strong> <s:if test='order.orderstateId==1'>
							未支付
						</s:if> <s:if test='order.orderstateId==3'>
							未发货
						</s:if> <s:if test='order.orderstateId==4'>
							已发货
						</s:if> <s:if test='order.orderstateId==7'>
							未评价
						</s:if> <s:if test='order.orderstateId==8'>
						已评价
						</s:if>
					</strong>
				</dd>
			</dl>
			<dl class="amount clearfix">
				<dt>订单编号：</dt>
				<dd>
					<s:property value="order.orderId" />
				</dd>
			</dl>
			<ul class="usemod">
				<li>&nbsp;<span> </span>

				</li>
				<li><span>相关操作：</span><a href="viewOrder">我买到的商品</a></li>
			</ul>
		</div>
	</div>

	<div class="wrapper">
		<ul class="modgoods-tab mt20 clearfix" id="zp-tab-order">

			<li rel="zp-order" class="cur">订单详细信息</li>

		</ul>

		<div class="paymentbox-2 " id="zp-order" style="">
			<div class="informod">
				<div class="hd">订单信息</div>
				<dl class="orderinfor-mod clearfix">
					<dt>订单编号：</dt>
					<dd>
						<s:property value="order.orderId" />
					</dd>
					<dt>下单时间：</dt>
					<dd>
						<s:property value="order.createTime" />
					</dd>
					<dt>支付方式：</dt>
					<dd>
						<s:property value="order.paymentWay" />
					</dd>
				</dl>

			</div>

			<div class=" confirm-table">
				<table width="100%">
					<tbody>
						<tr>
							<th class="th-1">所选商品</th>
							<th class="th-2">单价（元）</th>
							<th class="th-3">数量</th>
							<th class="th-4">优惠</th>
							<th class="th-5">小计（元）</th>
						</tr>
						<tr class="spacing">
							<td colspan="5"></td>
						</tr>



						<s:iterator value="order.orderItemList">
							<tr>
								<td class="s-infor"><a
									href="#"
									class="pic" target="_blank"><img width="80" height="60"
										src="<s:property value="product.picture" />"></a>
									<div class="inforbox">
										<h3 class="tit">
											<a
												href="viewProduct?product.productId= <s:property value="product.productId" /> "
												target="_blank"><s:property value="product.name" /></a>
										</h3>
										<div class="security clearfix"></div>
										<p>颜色：灰色行货16GB</p>
										<div class="info-con zp-suit-show">
											<span>套装：官方标配</span>
											<div class="info-help">
												<h5>官方标配：</h5>
												<p>【内置锂电池（3100mAh），充电器（即线充），数据线（也用于充电），取卡针，使用说明书，保修卡】</p>
											</div>
										</div>
									</div></td>
								<td class="s-price"><em><s:property
											value="product.sellPrice" /></em></td>
								<td class="s-amount">
									<div class="buy-num">
										<s:property value="amount" />
									</div>
								</td>
								<td class="s-agio">---</td>
								<td class="s-total"><em><s:property value="attr2" /></em></td>
							</tr>
						</s:iterator>





						<tr class="total-cost">
							<td colspan="5">



								<dl>
									<dt>应付总额（含运费0元）：</dt>
									<dd>
										<em><s:property value="order.totalPrice" /></em>元
									</dd>
								</dl>

							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>


	<div class="footer">

		<p></p>





	</div>

</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!-- saved from url=(0037)http://order.zol.com/index.php?c=Cart -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gbk">
<title>购物车 查看购物车</title>
<link href="./css_js/cart/orderPublic_v1.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/cart/cart_v1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- topbar -->
	<link href="./css_js/cart/publicHead.css" rel="stylesheet"
		type="text/css">
	<%@ include file="../common/IncludeTop.jsp"%>
	<!-- //topbar -->
	<!-- header -->
	<div class="header clearfix">
		<!--logo样式 -->
		<div class="logo">
			<a href="main" title="中关村商城"><img
				src="./css_js/cart/shop_212x40.jpg" width="212" height="40"></a>
			<!--script src="http://icon.zol-img.com.cn/zol_shop/js/public/logo.com.zol.js"></script-->
		</div>
		<div class="flow-step">
			<ul class="flow-step-1">
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
		<form action="updateCartQuantities" method="post" id="1188254224">
			<div class="cart-state mt">
				<div class="total">
					<input name="submitCart" type="submit" value="更新"> <span>总计（不含运费）：<em
						class="total-cart-price"><s:property value="car.totalMoney" /></em></span>
				</div>
			</div>
			<div class="order-table mt20">
				<table width="100%">
					<tbody>


						<tr>
							<th class="th-1"></th>
							<th class="th-2">所选商品</th>
							<th class="th-3">单价（元）</th>
							<th class="th-4">数量</th>
							<th class="th-6">小计（元）</th>
							<th class="th-7">操作</th>
						</tr>
						<tr id="merchant_188530">
							<td colspan="7" class=" store-infor clearfix"><div
									class="shopname"></div>
								<div class="contact"></div>
								<div class="contact"></div></td>
						</tr>

						<s:iterator value="car.cartItemList" status="status">
							<tr rel="goods-order" id="cart_2079763">
								<td colspan="2" class="s-infor"><a
									href="http://www.zol.com/detail/cell_phone/meizu/25241783.html"
									class="pic" target="_blank"><img width="80" height="60"
										src="<s:property value="product.picture" />"
										alt="<s:property value="product.name" />"></a>
									<div class="inforbox">
										<h3 class="tit">
											<a
												href="http://www.zol.com/detail/cell_phone/meizu/25241783.html"
												title="魅族 魅蓝Note 2（双4G）【下单即送透明壳】青年良品 64位8核cpu 1080p全贴合高清屏"
												target="_blank"><s:property value="product.name" /></a>
										</h3>
										<p>颜色：白色厂商指导价16GB</p>
										<div class="info-con">
											<span>套装：官方标配</span>
										</div>
									</div></td>
								<td class="s-price "><em><s:property
											value="product.sellPrice" /></em></td>
								<td class="s-amount "><div class="buy-num">
										<a class="minus" href="javascript:decrease('${status.index }');" title="减一" id="decrease">-</a> <input type="text"
											autocomplete="off" class="text-amount"
											value=<s:property value="quantity" /> id="${status.index }"
											name="<s:property value="product.productId"/>"> <a
											class="plus" href="javascript:increase('${status.index }');" title="加一" id="increase">+</a>
											<script type="text/javascript">
												function increase(id){
													var number = document.getElementById(id);
													number.setAttribute("value", (+number.getAttribute("value"))+1);
												}
												function decrease(id){
													var number = document.getElementById(id);
													if((+number.getAttribute("value"))==1)
														return ;
													number.setAttribute("value", (+number.getAttribute("value"))-1);
												}
											</script>
									</div></td>
								<td class="s-total"><em id="cartGoodsPcie_2079763"><s:property
											value="total" /></em></td>
								<td class="s-del"><div class="s-delbox">
										<a
											href="saveToMyAccount?productId=<s:property value="product.productId"/>"
											title="移入收藏夹">移入收藏夹</a> <a
											href="removeProductFromCart?removeProductId=<s:property value="product.productId"/>">删除</a></td>
							</tr>
						</s:iterator>






					</tbody>
				</table>
				<div class="total-price">
					商品总价<span>（不含运费）</span>：<em class="total-cart-price"><s:property
							value="car.totalMoney" /></em>
				</div>
			</div>
		</form>
		<div class="order-foot clearfix">
			<a href="main" class="go-shopping">&lt;&lt;继续购物</a>
			<form action="confirmOrder" method="post">
				<input type="submit" value="去结算" name="submitCart"
					class="accounting-btn">
			</form>
		</div>
	</div>
	<div class="footer">
		<p>
			<span class="copyright">
	</div>
	<img style="display:none" id="dot_pvm" border="0" width="1" height="1"
		src="./css_js/cart/pvhit0001.gif">
	<img style="display:none" border="0" width="1" height="1"
		src="./css_js/cart/pvhit0001(1).gif">
	</div>

</body>
</html>

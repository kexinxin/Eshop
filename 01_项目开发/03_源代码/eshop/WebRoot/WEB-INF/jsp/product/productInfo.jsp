<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script src='js/jquery-1.8.3.min.js'></script>
<script src='js/jquery.elevateZoom-3.0.8.min.js'></script>
<!DOCTYPE html>
<html>
<head>
<title>商品详情</title>
<link href="./css_js/productInfo/detail_excellent.css" rel="stylesheet">
<link href="./css_js/productInfo/public-topbar.css" rel="stylesheet">
<link href="./css_js/productInfo/public_002.css" rel="stylesheet">
<link href="./css_js/productInfo/feedBack.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/productInfo/MagicZoom.css" rel="stylesheet"
	type="text/css">
<link href="./css_js/productInfo/MagicZoom.css" rel="stylesheet"
	type="text/css">
<style>
.productnav {
	z-index: 4;
}

.navmod {
	z-index: 5;
}
/*            .holiday-notice-bar{ height:30px; background:#fff6d7;overflow:hidden;}
            .holiday-notice-bar p{ width:100%; margin:0 auto; font:12px/30px arial; color:#626665; text-align:center;}*/
</style>
<link rel="icon" href="http://icon.zol-img.com.cn/zol_shop/favicon.ico"
	type="image/icon">
<link rel="shortcut icon"
	href="http://icon.zol-img.com.cn/zol_shop/favicon.ico"
	type="image/icon">
<link type="text/css" rel="stylesheet"
	href="css_js/productInfo/public.css">
<link type="text/css" rel="stylesheet"
	href="css_js/productInfo/shopLoginBox.css">
<link charset="GBK" rel="stylesheet" type="text/css"
	href="css_js/productInfo/art.css">
<link charset="GBK" rel="stylesheet" type="text/css"
	href="css_js/productInfo/default.css">
<link rel="stylesheet" href="css_js/productInfo/share_style0_16.css">
<link type="text/css" rel="stylesheet"
	href="css_js/productInfo/public1.css">
<link type="text/css" rel="stylesheet"
	href="css_js/productInfo/shopLoginBox1.css">
<link rel="stylesheet" href="css_js/productInfo/share_style0_16.css">
</head>
<body>
	<%@ include file="../common/IncludeTop.jsp"%>
	<div class="header">
		<div class="wrapper clearfix">
			<div class="logo-box">
				<div class="logo">
					<a href="main" target="_blank" class="mall-logo"
						width="212px" height="40px"><img
						src="css_js/productInfo/zol.jpg" width="212px" height="40px"
						alt="ZOL Mail" /> </a>
				</div>
			</div>
			<div class="search" id="top-search-div">
				<form action="searchProductList" id="topSearch">
					<input name="keyword" style="height: 36px;" class="text" value="" id="keyWord"
						type="text" on> <input name="shop" rel="1"
						class="btn store" value="搜商城" style="javascript:void(0)"
						type="submit">
				</form>
			</div>
		</div>
	</div>
	<div class="navbar">
		<center>
			<div class="navmod">
				<ul class="mainnav clearfix">
					<li><a 
						href="viewChildCategoryProductList?category.categoryId=9"><center>平板</center></a></li>
					<li><a
						href="viewChildCategoryProductList?category.categoryId=1"
						><center>手机</center></a></li>
					<li><a
						href="viewChildCategoryProductList?category.categoryId=2"
						><center>笔记本</center></a></li>
					<li><a
						href="viewChildCategoryProductList?category.categoryId=7"
						><center>数码相机</center></a></li>
					<li><a
						href="viewChildCategoryProductList?category.categoryId=8"
						><center>耳机</center></a></li>
				</ul>
			</div>
		</center>
	</div>
	<!-- 公用头end -->
	<!-- //公共导航 -->
	<div class="zs-wrapper clearfix">
		<div class="zs-deal-detail">
			<!-- 焦点图 -->
			<div class="zs-focus">
				<div class="zs-big-pic" id="zs-big-pic" rel="gal1" style="min-height: 200px;">
					<a href="#" id="zoom1"
						rel=" drag-mode:false;always-show-zoom: false; zoom-position: custom;zoom-width:400px; zoom-height:400px"
						class="MagicZoom"
						style="cursor: crosshair; position: relative; display: block; outline: 0px; text-decoration: none; width: 400px;"><img
						src="${sessionScope.product.picture }" data-zoom-image="${sessionScope.product.attr1 }"  id="zoom_06" style="width=200px;height: 200px;"> </a>
				</div>
				<div class="zs-focus-thumb">
					<div class="zs-focus-list" id="zs-focus-list">
						<ul>
							<li style="float: left;margin-right: 10px;">
								<img onclick="replacePicture(0);" src="${sessionScope.product.picture }"  data-zoom-image="${sessionScope.product.attr1 }"  style="width: 56px;height: 48px;" id="picture1">
							</li>
							<li style="float: left;margin-right: 10px;">
								<img onclick="replacePicture(1);" src="${sessionScope.product.attr2 }"   data-zoom-image="${sessionScope.product.attr3 }"  style="width: 56px;height: 48px;" id="picture2">
							</li>
						</ul>
						
					</div>
				</div>
				<!-- //焦点图 -->
				<div class="zs-action clearfix">
                        <a href="saveProduct" class="zs-collect" ><i></i>关注商品</a>
                        <div class="zs-share-box">
                            <a href="#"  class="zs-complain"><i></i>分享</a>
                            <div onmouseover="$('#bdshare').css('display', 'block');" onmouseout="$('#bdshare').css('display', 'none');" style="display:none;" class="bdsharebuttonbox bdshare_t bds_tools get-codes-bdshare bdshare-button-style0-16" id="bdshare" data-bd-bind="1403577164954">
                                <a data-cmd="tsina" class="bds_tsina" title="分享到新浪微博"></a>
                                <a data-cmd="weixin" class="bds_weixin" title="分享到微信"></a>
                                <a data-cmd="qzone" class="bds_qzone" title="分享到QQ空间"></a>
                                <a data-cmd="tqq" class="bds_tqq" title="分享到腾讯微博"></a>
                            </div>
                        </div>
                    </div>
			</div>
			<div class="zs">
			<div class="zs-deal-wrap">
				<!-- 商品标题 -->
				<h3 class="zs-commodity-title">${sessionScope.product.name }</h3>
				<!-- //商品标题 -->
				<!-- 价格 -->
				<div class="zs-price-panel">
					<dl class="zs-sale-price">
						<dt>价格：</dt>
						<dd>
							<span class="zs-price" id="zp-promo-price">${sessionScope.product.sellPrice }</span>
						</dd>
					</dl>
				</div>
				<!-- //价格 -->
				<!-- 交易区块 -->
				<div class="zs-detail-infor">

					<!-- 颜色类别 -->
					<dl class="zs-colour-type">
						<dt>颜色类别：</dt>
						<dd>
							<ul class="zs-options clearfix" id="zp-choose-color">
								<li class="" num="17-9130-0" fn="1,2,3,4,5" title="蓝色行货16GB">
									<span class="can-buy">蓝色行货16GB<i></i></span>
								</li>
								<li class="" num="8-9130-0" fn="1,2,3,4,5" title="灰色行货16GB">
									<span class="can-buy">灰色行货16GB<i></i></span>
								</li>
								<li class="" num="11-9130-0" fn="1,2,3,4,5" title="白色行货16GB">
									<span class="can-buy">白色行货16GB<i></i></span>
								</li>
								<li class="" num="12-9130-0" fn="1,2,3,4,5" title="粉色行货16GB">
									<span class="can-buy">粉色行货16GB<i></i></span>
								</li>
							</ul>
						</dd>
					</dl>
					<form
						action="http://order.zol.com/index.php?c=ConfirmOrder&amp;a=BuyNow"
						method="post" name="confirmOrderSubmit" id="confirmOrderSubmit">
						<!-- 购买数量 -->
						<dl class="zs-quantity">
							<dt>购买数量：</dt>
							<dd class="clearfix">
								<div class="amount-widget">
										<span onclick="decrease();" class="zs-decrease zs-no-decrease" id="decrease"><center>-</center></span> 
										<input name="zp-goods-number" title="请输入购买量" value="1"
										class="zs-goods-number" id="zp-goods-number"
										fn="zp-goods-number" type="text" maxlength="2" readonly="readonly"> 
										<span onclick="increase();" class="zs-increase" id="increase" ><center>+</center></span>
								<script type="text/javascript">
									function increase(){
										var number = document.getElementById("zp-goods-number");
										number.setAttribute("value", (+number.getAttribute("value"))+1);
									}
									function decrease(){
										var number = document.getElementById("zp-goods-number");
										if((+number.getAttribute("value"))==1)
											return ;
										number.setAttribute("value", (+number.getAttribute("value"))-1);
									}
								</script>
								</div>
								<span class="zs-part">件</span>
							</dd>
						</dl>
						<dl class="zs-quantity">
							<dt>库存量：</dt>
							<dd class="clearfix">
								
								<span class="zs-part">${sessionScope.product.qty} 件</span>
							</dd>
						</dl>
						<!-- 购买数量end -->
						<!-- 立即购买 -->
						<div class="zs-deal-btn clearfix">
							<a style="cursor:pointer;" title="立即购买" class="zs-buy-now"
								id="buynow" onclick="buyNow();"  href="payNow">立即购买</a> <a
								href="addProductToCart?productInfoId=${sessionScope.product.productId}"
								class="zs-store-buy"		
								title="加入购物车">加入购物车</a>
						</div>
						<!-- 立即购买end -->
					</form>
				</div>
				<!-- //交易区块 -->
			</div>
		</div>
		<!-- 保障 -->

		<!-- 保障end -->
	</div>
	<!-- 公用导航end -->
	<!-- 店铺优惠 -->
	<div class="wrapper clearfix" style="margin-top: 400px;">
		<center>
			<div class="zs-main">
				<div class="zs-tabbar zs-tabbar-nav clearfix" id="zsTabbar">
					<ul class="clearfix" id="zp-tabbar">
						<li class="cur" rel="zp-tab-goods-params"><a
							href="javascript:void(0)" rel="" onclick="changPane(0);">参数</a></li>
						<li rel="zp-tab-user-review"><a href="javascript:void(0)" onclick="changPane(1);">购买评价<em
								id="zp-nav-order-review">${sessionScope.valuationNum }</em></a></li>
						<li rel="zp-tab-order-record"><a href="javascript:void(0)">成交记录<em
								id="zp-nav-order-record">${sessionScope.valuationNum }</em></a></li>
					</ul>
				</div>
				<div class="zs-container" >
					<div id="descriptions">
						<s:iterator value="#session.descriptions" var="description">
							<table width="960px">
								<tr>
									<s:iterator value="description" var="item">
										<td>${item }</td>
									</s:iterator>
								</tr>
							</table>
						</s:iterator>
					</div>
					<div id="valuations" style="display: none">
						<s:iterator value="#session.productValuation" var="valuation">
							<div style="width: 950px;height:30px; margin-bottom: 20px;margin-top: 10px;border: 1px dashed rgb(228,224,224);border-radius:3px;" >
								<div id="valuation" style="float: left;margin-left: 20px;">${valuation }</div>
							</div>
						</s:iterator>
					</div>
				</div>
			</div>
		</center>
	</div>
	<div class="footer">
		<div class="footer-nav-bar"></div>
	</div>
	<script type="text/javascript">
		function changPane(index){
			var pane = document.getElementById("zp-tabbar");
			var panes = pane.getElementsByTagName("li");
			if(index==0){
				var descriptions = document.getElementById("descriptions");
				var valuations = document.getElementById("valuations");
				descriptions.style.display="block";
				valuations.style.display="none";
				panes[0].style.background="#fff";
				panes[0].style.border="1px solid #ededed";
				panes[0].style.borderTop="2px solid #c00";
				panes[0].style.borderBottom="0 none";
				panes[1].style.background="#fafafa";
				panes[1].style.border="1px solid #ededed";
				panes[1].style.borderTop="1px solid #ededed";
				panes[1].style.borderBottom="0 none";
			}else{
				var descriptions = document.getElementById("descriptions");
				var valuations = document.getElementById("valuations");
				valuations.style.display="block";
				descriptions.style.display="none";
				panes[1].style.background="#fff";
				panes[1].style.border="1px solid #ededed";
				panes[1].style.borderTop="2px solid #c00";
				panes[1].style.borderBottom="0 none";
				panes[0].style.background="#fafafa";
				panes[0].style.border="1px solid #ededed";
				panes[0].style.borderTop="1px solid #ededed";
				panes[0].style.borderBottom="0 none";
			}
			
		}
		function replacePicture(index){
			var mainPicture = document.getElementById("zoom_06");
			var picture1 = document.getElementById("picture1");
			var picture2 = document.getElementById("picture2");
			if(index==0){
				mainPicture.setAttribute("src", picture1.getAttribute("src"));
				picture1.style.border="2px solid #ff0000";
				picture2.style.border="none";
			}else{
				mainPicture.setAttribute("src", picture2.getAttribute("src"));
				picture1.style.border="none";
				picture2.style.border="2px solid #ff0000";
			}
		}
	</script>
	
	<script>
	$('#zoom_01').elevateZoom({});

	$('#zoom_02').elevateZoom({
		zoomType : "inner",
		cursor : "crosshair",
		zoomWindowFadeIn : 500,
		zoomWindowFadeOut : 750
	});

	$("#zoom_03").elevateZoom({
		zoomType : "lens",
		lensShape : "round",
		lensSize : 200
	});

	$("#zoom_04").elevateZoom({
		zoomWindowFadeIn : 500,
		zoomWindowFadeOut : 500,
		lensFadeIn : 500,
		lensFadeOut : 500
	});

	$("#zoom_05").elevateZoom({
		easing : true
	});

	$("#zoom_06").elevateZoom({
		scrollZoom : true
	});
</script>
</html>
</body>
</html>
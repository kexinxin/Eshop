<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gbk">
<title>订单支付-E购商城</title>
<link href="css_js/payFinish/orderPublic_v1.css" rel="stylesheet" type="text/css">
<link href="css_js/payFinish/order_v2.css" rel="stylesheet" type="text/css">
<script src="css_js/payFinish/jquery-1.6-min.js"></script>

<style>
body a {
	cursor: pointer;
}
</style>
<script type="text/javascript" async="" charset="utf-8" src="css_js/payFinish/zgc_shop.js"></script><script id="" src="css_js/payFinish/StdID.do" charset="utf-8"></script><script src="css_js/payFinish/bcore.min.js" type="text/javascript"></script><script src="css_js/payFinish/Order.do" charset="utf-8"></script><script src="css_js/payFinish/PageView.do" charset="utf-8"></script></head>

<body>
    <!-- header -->
    <!-- topbar -->
    <script src="css_js/payFinish/index.php"></script>
    <link href="css_js/payFinish/publicHead.css" rel="stylesheet" type="text/css">
    
    <%@ include file="../common/IncludeTop.jsp"%>
    
    
    <!-- //topbar --> 
    <!-- header -->
    <div class="header clearfix">
        <!--logo样式 -->
        <div class="logo">
            <a href="main" title="中关村商城">
                <img src="css_js/payFinish/shop_212x40.jpg" width="212" height="40">
			</a>
            <!--script src="http://icon.zol-img.com.cn/zol_shop/js/public/logo.com.zol.js"></script-->
        </div>
        <div class="flow-step">

            <ul class="flow-step-3">
                <li class="s1">加入购物车</li>
				<li class="s2">下订单</li>
				<li class="s3">去付款</li>
				<li class="s4">确认收货</li>
				<li class="s5">评价</li>
            </ul>
        </div>
    </div>
    <!-- //header -->        <!-- //header -->
    <div class="wrapper">
        <div class="payment-box">
            <div class="order-status-box">
                <div class="submit-complete clearfix">
                    <div class="order-status" text-align=center>
                        <img src="css_js/payFinish/123.png" >
                        <h3 class="prompt">订单支付成功,请耐心等待卖家发货</h3>
                        <div class="details">
                            <p>
                                <span>您的订单号：<s:property value="order.orderId" /></span>
                                <span>支付方式：网上支付</span>
                                <span>配送方式：包邮</span>
                            </p>
                            <p>
                                <span>收货地址：<s:property value="order.address" /> </span>
                                <span>收货人：<s:property value="order.attr1" /></span><span>电话:<s:property value="order.mobile" /></span>
                            </p>
                            <div class="order-detail">							
                                <div class="goods-name">
                                    <span class="label">创建时间：</span>
                                    <p style="width:500px;"><span><s:property value="order.createTime" /></span></p> 

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="amount-code">
                        <div class="code">
                            
                        </div>
                        

                    </div>
                </div>
            </div>
            </div>
          </div>
<!-- //公共底部 --> 

<!-- 确认付款弹层1 -->

<!-- //确认付款弹层1 --> 

<!-- 全屏遮罩 -->
<div class="layerbox-overlay" id="layerbox-overlay"></div>
<!-- //全屏遮罩 -->


      </body></html>
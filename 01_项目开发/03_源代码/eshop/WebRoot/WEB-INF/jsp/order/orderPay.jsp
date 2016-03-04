<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gbk">
<title>订单支付-E购商城</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link href="css_js/orderPay/orderPublic_v1.css" rel="stylesheet" type="text/css">
<link href="css_js/orderPay/order_v2.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- header -->
<!-- topbar -->
<link href="css_js/orderPay/publicHead.css" rel="stylesheet" type="text/css">
<div class="topbar" style="font:12px/1.5 Arial; color:#333;">
<%@ include file="../common/IncludeTop.jsp"%>
</div>
<!-- //topbar -->
<!-- header -->
<div class="header clearfix">
  <!--logo样式 -->
  <div class="logo"> 
  	<a href="main" title="中关村商城"> 
  		<img src="css_js/orderPay/shop_212x40.jpg" width="212" height="40">
  	</a>
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
<!-- //header -->
<!-- //header -->
<div class="wrapper">
  <div class="payment-box">
    <div class="order-status-box">
      <div class="submit-complete clearfix">
        <div class="order-status">
          <h3 class="prompt">订单已提交，请在<span>72小时</span>内完成付款（逾期自动取消）</h3>
          <div class="details">
            <p> <span>您的订单号：<s:property value="order.orderId" /></span> <span>支付方式：网上支付</span> <span>配送方式：包邮</span> </p>
            <p> <span>收货地址：<s:property value="order.address" /> </span> <span>收货人：<s:property value="order.username" /></span><span>电话：<s:property value="order.mobile" /></span> </p>
            <div class="order-detail">
            </div>
          </div>
        </div>
        <div class="amount-code">
          <div class="price">应付金额<span><s:property value="order.tatalPrice" /></span>元</div>
        </div>
      </div>
    </div>
    <div class="payment-way">
      <dl id="use_bank_pay_div" fn="use_bank_pay" class="payment-selected">
        <dt><span class="radiobox radiobox-selected" id="use_bank_pay" fn="1" item="0"></span>使用银行卡支付：</dt>
        <!--上次使用的银行卡-->
        <dd class="clearfix"> <span class="pay-amount" id="last_bank_alipay_tips">支付<em><s:property value="order.tatalPrice" /></em>元</span> </dd>
        <!--新银行卡对应的银行信息-->
        <dd class="bank-box" id="new_pay_method">
          <ul class="tab-bar clearfix" id="pay_method_choose">
            <li class="current" fn="bank_pay_list">网银支付</li>
          </ul>
          <div class="bank-list clearfix" id="bank_pay_list" style="display:block;"> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=ICBCB2C&amp;token=eaa4cb391c2788d3736a035e44017765"><img src="css_js/orderPay/zggsyh_138x38.png" width="138" height="38" title="中国工商银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=ABC&amp;token=ac5f94f0105016379fd0c00f1b4f7e4b"><img src="css_js/orderPay/zgnyyh_138x38.png" width="138" height="38" title="中国农业银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=CMB&amp;token=4063de2442dd74302939663d891162cb"><img src="css_js/orderPay/zsyh_138x38.png" width="138" height="38" title="招商银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=CCB&amp;token=6f3e2d437e48776d83c55ff127371b3d"><img src="css_js/orderPay/zgjsyh_138x38.png" width="138" height="38" title="中国建设银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=CIB&amp;token=c42a4dc413351ff2909c6e32d2d00147"><img src="css_js/orderPay/xyyh_138x38.png" width="138" height="38" title="兴业银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=CMBC&amp;token=064be58437a3f06e7ad982d71bfeab92"><img src="css_js/orderPay/zgmsyh_138x38.png" width="138" height="38" title="中国民生银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=BOCB2C&amp;token=d54ab0b43cbf23617454e2d594d88ac2"><img src="css_js/orderPay/zgyh_138x38.png" width="138" height="38" title="中国银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=SHRCB&amp;token=251a7922430599dbf8f85ea0dec1f413"><img src="css_js/orderPay/shrcc_138x38.gif" width="138" height="38" title="上海农村商业银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=COMM&amp;token=41a2eeb33d4c6ce4567e5871a0dd2aab"><img src="css_js/orderPay/zgjtyh_138x38.png" width="138" height="38" title="中国交通银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=PSBC-DEBIT&amp;token=eeeb6fa5a3b6bac9492f44d329986279"><img src="css_js/orderPay/zgyzcxyh_138x38.png" width="138" height="38" title="中国邮政储蓄银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=BJBANK&amp;token=824a20e6e49ace37d6203300dac82c38"><img src="css_js/orderPay/bjyh_138x38.png" width="138" height="38" title="北京银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=BJRCB&amp;token=3990dcdbada1c646c2ef398b9f86bea9"><img src="css_js/orderPay/bjncsyyh_138x38.png" width="138" height="38" title="北京农村商业银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=HZCBB2C&amp;token=16bacc3af9bf41fdf6235df4e1049ae6"><img src="css_js/orderPay/hzyh_138x38.png" width="138" height="38" title="杭州银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=NBBANK&amp;token=84a46a50a0449657a959c20fbbdd3093"><img src="css_js/orderPay/nbyh_138x38.png" width="138" height="38" title="宁波银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=SHBANK&amp;token=fbc9cdb0ec0e4e2b11b2b882c5b3c2ce"><img src="css_js/orderPay/shyh_138x38.png" width="138" height="38" title="上海银行"></a> 
          	<a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;payWay=bankPay&amp;bankId=SPABANK&amp;token=c5c9158ac5c70a9edeb219334c093a90"><img src="css_js/orderPay/pinganyh_138x38.gif" width="138" height="38" title="平安银行"></a> 
          </div>
        </dd>
      </dl>
      <dl class="third-party" id="use_alipay_pay_div" fn="use_alipay_pay">
        <dt><span class="radiobox" id="use_alipay_pay" fn="2"></span>使用第三方支付：</dt>
        <dd id="not_use_alipay"> <a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;token=afa1f54d51dc6e569563476f75c8725f"><img src="css_js/orderPay/zplus_alipay.png" width="130" height="41" title="支付宝"></a> </dd>
        <dd id="use_alipay" class="clearfix" style="display:none;">
          <div class="way-selected"> <a fn="http://order.zol.com/index.php?c=Pay&amp;a=OrderPay&amp;orderId=1771136&amp;payType=2&amp;token=afa1f54d51dc6e569563476f75c8725f"><img src="css_js/orderPay/zplus_alipay.png" width="130" height="41" title="支付宝"></a> <span class="tips">支持非支付宝会员支付</span> </div>
          <span class="pay-amount" id="last_alipay_tips">支付<em>879.00</em>元</span> </dd>
      </dl>
      <div class="operation  clearfix">  <a href="payFinish?orderId=<s:property value="order.orderId" />"  id="can_pay_submit"  class="pay-submit-btn">立即支付</a> <span id="can_pay_tips" class="tips">您将使用银行卡支付</span> </div>
    </div>
  </div>
</div>
<!-- 公共底部 -->
<div class="footer"> </div>
<!-- //公共底部 -->
<!-- 确认付款弹层1 -->
<!-- //确认付款弹层1 -->
</body>
</html>

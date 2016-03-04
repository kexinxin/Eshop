<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link href="./css_js/main/topbar.css" rel="stylesheet" type="text/css">
<div class="zc-topbar">
	<div class="wrapper clearfix">
		<div class="zc-login-info">
			<span class="zc-back-home"> <a href="main">商城首页</a></span>
			<s:if test="#session.account == null">
				<span class="zc-login">Hi~欢迎来到  E购商城，请<a href="intoLogin">登录</a></span>
				<span class="zc-register"><a href="register">免费注册</a></span>
			</s:if>
			<s:if test="#session.account != null">
				<span class="zc-login">欢迎   ${ sessionScope.account.username }来到商城       <a href="logout">退出</a></span>
			</s:if>
			
		</div>
		<ul class="zc-quick-menu">
			<li><a href="viewOrder">我的订单</a></li>
			<li class="zc-my-center" onmouseover="showUI(this)"
				onmouseout="hideUI(this)"><a href="viewMyAccount" class="zc-hd">买家中心<i
					class="ico"></i></a>
				<div class="zc-my-center-bd" id="zc-my-center-bd"
					style="display:none;">
					<a href="viewMyAccount">我的账户&nbsp;&nbsp;</a>
					<a href="viewMySaveItem">关注的商品&nbsp;&nbsp;</a>
				</div></li>
			<li><a href="viewCart" id="shop-cart-num">购物车</a></li>
			<li><a href="#">帮助中心</a></li>
			<li class="zc-mobile" onmouseover="showUI(this)"
				onmouseout="hideUI(this)">
				<div class="zc-mobile-bd" id="zc-mobile-bd" style="display:none;">
					<a href="javascript:;" onmouseover="showUI(this)"
						onmouseout="hideUI(this)" class="zc-hd">联系客服<i class="ico"></i></a>
					<div class="zc-service-tel">400-678-0068</div>
				</div>
			</li>
		</ul>
	</div>
</div>
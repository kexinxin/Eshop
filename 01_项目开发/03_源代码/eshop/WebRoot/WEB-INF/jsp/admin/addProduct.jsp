<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0037)http://my.zol.com/index.php?c=Setting -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">

<title>关注商品-我的关注--买家中心</title>
<link href="./css_js/addProduct/public.css" rel="stylesheet" type="text/css">
<link href="./css_js/addProduct/foot.css" rel="stylesheet" type="text/css">
<link href="./css_js/addProduct/publicTips.css" rel="stylesheet" type="text/css">
<link href="./css_js/addProduct/score.css" rel="stylesheet" type="text/css">
<link href="./css_js/addProduct/ui.all.css" rel="stylesheet" type="text/css">
<style>.main b{display:none}</style>
<script type="text/javascript" async="" charset="utf-8" src="./css_js/addProduct/zgc_member.js"></script><script src="./css_js/addProduct/bcore.min.js" type="text/javascript"></script><script src="./css_js/addProduct/PageView.do" charset="utf-8"></script></head>

<body>
    <!-- header start-->
    <!-- 公用导航 start -->
    
    <!-- 公用导航 end -->

    <!-- header start-->
    <div class="header">
        <div class="wrapper clearfix">
            <a href="#" class="logo"></a>
            <div style="float: right;">
            	欢迎你，${sessionScope.admin.adminName }
	            <a href="adminLogout" style="float: right;cursor: pointer;">退&nbsp;&nbsp;出</a>
            </div>
        </div>
    </div>
    <!-- header end--><!-- header end-->
    <div class="mainbody module clearfix">
     <!-- header end-->
     <div class="side">
			<h3>
				<a href="#">管理中心</a>
			</h3>
			<ul class="nav clearfix">
				
				<li><a href="viewAllAccount">账户管理</a></li>
				<li><a href="intoAdminOrderManage"> 订单管理 </a></li>
				<li class="current"><span>商品添加</span></li>
				<li><a href="intoCustomerLog">用户日志</a></li>
				<li><a href="intoStateChangeLog">订单日志 </a></li>
			</ul>
		</div>
     	<div class="main">
                <div class="mainbg"></div>
                <div class="personal-settings">
                   <div class="photo-tab">
                    <ul class="clearfix">
                     <li class="hover">产品信息</li>
                 </ul>
             </div>
             <!-- 增加新地址 add-address -->
			<form action="upload_addProduct" method="post" enctype="multipart/form-data">
             <div class="add-address" id="contentBox">
                <div class="add-address-header">请填写产品信息</div>
                <input type="hidden" id="addressId" value="">
                <div class="item item2">
                    <label class="list-title" for="name"><i>*</i>产品名字：</label>
                    <p>
                        <input class="text" id="name" type="text" maxlength="10" name="name">
                        <b class="correct"></b>
                        <b class="error">请输入中文汉字</b>
                    </p>
                </div>
                <div class="item item2" >
                    <label class="list-title"><i>*</i>采购价格：</label>
                    <p><input class="text" id="address" maxlength="30" type="text" name="basePrice"></p>
                </div>
                <div class="item item2">
                    <label class="list-title" for="address"><i>*</i>市场价格：</label>
                    <p><input class="text" id="address" maxlength="30" type="text" name="marketPrice"><b class="correct"></b><b class="error">请填写真实的收货地址</b></p>
                </div>
                <div class="item item2">
                    <label class="list-title" for="zipcode"><i>*</i>销售价格：</label>
                    <p><input class="text" id="zipcode" type="text" maxlength="6" name="sellPrice"><b class="correct"></b><b class="error">请填写正确的六位邮编</b></p>
                </div>
                
                <div class="item item2">
                    <label class="list-title" for="phone"><i>*</i>是否推荐：</label>
                    <p><input class="text" id="phone" type="radio"  name="comment" value="1" style="width:30px;" >是<br>
                    <input class="text" id="phone" type="radio"  name="comment" value="0" style="width:30px;">否
                    <b class="correct"></b><b class="error">固定电话和手机至少填写一个</b></p>
                </div>
                <div class="item item2">
                    <label class="list-title" for="phone"><i>*</i>描述：</label>
                    <p><textarea rows="5"  cols="20" name="description" style="width: 224px;height: 100px;max-width: 224px;max-height: 100px;" class="text" d="phone"></textarea><b class="correct"></b><b class="error">固定电话和手机至少填写一个</b></p>
                </div>
                <div class="item item2">
                    <label class="list-title" for="phone"><i>*</i>类别ID：</label>
                    <p><input class="text" id="phone" type="text" maxlength="11" name="categoryId"><b class="correct"></b><b class="error">固定电话和手机至少填写一个</b></p>
                </div>
                <div class="item item2">
                    <label class="list-title" for="phone"><i>*</i>上传图片：</label>
                    <p>
                    <form action="upload" method="post" enctype="multipart/form-data">
	                    <s:file name="upload" class="text" id="phone"></s:file>
	                    <b class="correct"></b><b class="error">固定电话和手机至少填写一个</b>
                    </form>
                    </p>
                </div>
                 <div class="item item2">
                    <label class="list-title" for="phone"><i>*</i>库存：</label>
                    <p><input class="text" id="phone" type="text" maxlength="11" name="qty"><b class="correct"></b><b class="error">固定电话和手机至少填写一个</b></p>
                </div>
                <div class="item item2">
                    <label class="list-title" for="email">公司名称：</label>
                    <p><input class="text" id="email" type="text" maxlength="50" name="company"><b class="correct"></b><b class="error">邮箱格式不正确</b></p>
                    <p class="set-default"><label></label></p>
                    <p><input type="submit" value="保存" class="btn" id="saveAddress" style="width: 120px;height: 40px;line-height: 40px;font-size: 14px;display: block;color: #fff;cursor: pointer;font-family: Microsoft YaHei,arial;border:0px;background-color:#008EE1; "></p>
                </div>
                
            </div>
			</form>
            
            </div>
        </div>
    </div>

   </body></html>
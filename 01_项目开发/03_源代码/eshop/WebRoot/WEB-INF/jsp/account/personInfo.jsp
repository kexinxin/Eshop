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
<link href="./css_js/personInfo/public.css" rel="stylesheet" type="text/css">
<link href="./css_js/personInfo/foot.css" rel="stylesheet" type="text/css">
<link href="./css_js/personInfo/publicTips.css" rel="stylesheet" type="text/css">
<link href="./css_js/personInfo/score.css" rel="stylesheet" type="text/css">
<link href="./css_js/personInfo/ui.all.css" rel="stylesheet" type="text/css">
<style>.main b{display:none}</style>
</head>

<body>
    <!-- header start-->
    <!-- 公用导航 start -->
   <%@ include file="../common/IncludeTop.jsp"%>
    <!-- 公用导航 end -->

    <!-- header start-->
    <div class="header">
        <div class="wrapper clearfix">
            <a href="viewMyAccount" class="logo"></a>
            <div class="searchbox">
                <form action="searchProductList" method="GET" target="_blank">
                    <div class="searchmod">
                        <input name="c" type="hidden" value="List">
                        <input name="keyword" type="text" class="searchtext" placeholder="搜索商品/店铺" maxlength="50" autocomplete="off">
                        <ul style="display:none;"></ul>
                    </div>
                    <input name="do_search" type="submit" value="搜索" class="searchbtn">
                </form>
            </div>
        </div>
    </div>
    <!-- header end--><!-- header end-->
    <div class="mainbody module clearfix">
     <!-- header end-->
     <div class="side">
    <h3><a href="viewMyAccount">买家中心</a></h3>
    <ul class="nav clearfix">
      <li> <a href="viewOrder">订单管理</a> </li>
      <li><a href="viewMySaveItem"> 我的关注 </a></li>
      <li class="current"><span>个人信息</span></li>
    </ul>
  </div>	
      <div class="main">
                <div class="mainbg"></div>
                <div class="personal-settings">
                   <div class="photo-tab">
                    <ul class="clearfix">
                     <li class="hover">个人信息设置</li>
                     <li ><a href="passwordReset"  id="goZOLHomeCenterPass" >修改密码</a></li>
                 </ul>
             </div>
             <!-- 增加新地址 add-address -->

             <div class="add-address" id="contentBox">
                <div class="add-address-header">个人信息</div>
                <input type="hidden" id="addressId" value="">
                <form action="changeInfo" method="post">
                <div class="item item2">
                    <label class="list-title" for="name"><i>*</i>用户账号：</label>
                    <p>
                        <input class="text" id="name"  style="background-color: rgb(235, 236, 237);"  type="text" readonly="readonly" maxlength="10" value="${sessionScope.account.username }" name="username">
                        <b class="correct"></b>
                        <b class="error">请输入中文汉字</b>
                    </p>
                </div>
                
                <div class="item item2">
                    <label class="list-title" for="address"><i>*</i>收货地址：</label>
                    <p><input class="text" id="address" maxlength="30" type="text" value="${sessionScope.account.address }" name="address"><b class="correct"></b><b class="error">请填写真实的收货地址</b></p>
                </div>
                
                <div class="item item2">
                    <label class="list-title" for="address"><i>*</i>积分：</label>
                    <p><input class="text" id="address" maxlength="30" readonly="readonly" type="text" value="${sessionScope.account.integrate }"  style="background-color: rgb(235, 236, 237);"  name="address"><b class="correct"></b><b class="error">请填写真实的收货地址</b></p>
                </div>
                <div class="item item2">
                    <label class="list-title" for="phone"><i>*</i>手机号码：</label>
                    <p><input class="text" id="phone" type="text" maxlength="11" value="${sessionScope.account.mobile }" name="mobile"><span class="stips">固定电话或手机</span><b class="correct"></b><b class="error">固定电话和手机至少填写一个</b></p>
                </div>
                <div  class="item item2">
                    <p class="set-default"><input style="width:120px;height:40px;font-size:14px;display:block;cursor:pointer;background-color: #008EE1;border:0px;"  type="submit" value="保存修改" id="setDefault"></p>
                </div>
                </form>
            </div>
            <!-- 填写新地址 add-address end -->
            </div>
        </div>
    </div>

    <!--底部-->
    <!--底部-->
    <div class="wrapper">
        <div class="footer mt">
           
            
        <div class="authentication"> 
           
        </div>
    </div>
</div>
</body>
</html>
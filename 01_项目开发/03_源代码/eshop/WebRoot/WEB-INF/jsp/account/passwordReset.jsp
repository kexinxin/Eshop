<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0037)http://my.zol.com/index.php?c=Setting -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">

<title>关注商品-我的关注--买家中心</title>
<link href="./css_js/passwordReset/public.css" rel="stylesheet" type="text/css">
<link href="./css_js/passwordReset/foot.css" rel="stylesheet" type="text/css">
<link href="./css_js/passwordReset/publicTips.css" rel="stylesheet" type="text/css">
<link href="./css_js/passwordReset/score.css" rel="stylesheet" type="text/css">
<link href="./css_js/passwordReset/ui.all.css" rel="stylesheet" type="text/css">
<link href="./css_js/passwordReset/My_baseinfonew.css" rel="stylesheet" type="text/css">
<style>.main b{display:none}</style>
</head>

<body>
    <!-- header start-->
    <!-- 公用导航 start -->
    <%@ include file="../common/IncludeTop.jsp"%>
    <div class="header">
        <div class="wrapper clearfix">
            <a href="viewMyAccount" class="logo"></a>
            <div class="searchbox">
                <form action="searchProductList" method="GET" ">
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
        <h3><a href="http://my.zol.com/">买家中心</a></h3>
        <ul class="nav clearfix">
            <li>
                <a href="viewOrder">订单管理</a>
            </li>
            <li>
                <a href="viewMySaveItem">我的关注</a>
            </li>
           <li class="current">
                <span>个人设置<a href="viewMyAccount"></a></span>
            </li>
        </ul>
      </div>	
      <div class="main">
                <div class="mainbg"></div>
                <div class="personal-settings">
                   <div class="photo-tab">
                    <ul class="clearfix">
                     <li ><a href="viewMyAccount" " id="goZOLHomeCenterPass">个人信息设置</a></li>
                     <li class="hover"><a href="passwordReset" " id="goZOLHomeCenterPass">修改密码</a></li>
                 </ul>
             </div>
             <!-- 增加新地址 add-address -->

             <div class="main">     
        <!-- 修改密码 -->
        <div class="section">
            <div class="setting-cont" style="padding-left:150px">
                <form class="form-box" id="settingForm" method="post" target="_self" action="passwordReset" >
                    <input type="hidden" name="token" id="token" value="9696vz87IKJPauMVxKV774rDk6MF0tixh0R8ZFQhb6RHxopuVcaIzfROOuhb9NXKBF3-ZV-YAdq_J7NIDYowX_wT2dhRijgPTtY8jVUoVRFA-WLvk2RcZzaolx5bnQ">
                    <input type="hidden" name="act" id="act" value="passwordSet">
                    <div class="data-item">
                        <span class="label">旧密码：</span>
                        <div><input tabindex="1" name="password" id="oldPwd"  type="password" value="" class="text" maxlength="20" alt=""><span class="tip"></span></div>
                    </div>
                    <div class="data-item">
                        <span class="label">新密码：</span>
                        <div><input tabindex="2" name="newpasswrd" id="pwd"  type="password" value="" class="text" maxlength="20" alt=""><span class="tip">4-16位数字/字母/特殊符号(空格除外)</span></div>
                    </div>
                    <div class="data-item">
                        <span class="label">确认新密码：</span>
                        <div><input tabindex="3" name="renewpassword" id="sa_pwd"  type="password" value="" class="text" maxlength="20" alt=""><span class="tip"></span></div>
                    </div>
                    <div class="save-btn"><input type="submit" id="password_set" class="btn-blue-w120 border-ra2" value="保存修改"></div>
                </form>
            </div>
        </div>
        <!-- //修改密码 -->
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
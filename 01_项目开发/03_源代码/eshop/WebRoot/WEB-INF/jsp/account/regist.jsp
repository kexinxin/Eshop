<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0052)https://login.zol.com/index.php?c=Default&a=Register -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gbk">
<title>注册_E购商城</title>
<link href="css_js/regist/login.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrapper">
    <div class="header clearfix">
            <!-- register-bar add by hanjw 2014-6-24-->
            <div class="register-bar"><a href="intoLogin">立即登录</a>已经有E购商城账号？</div>
            <!-- //register-bar add by hanjw 2014-6-24-->
                    <div class="logo"> 
                <!-- modify by hanjw 2014-6-24 -->
                <a title="ZOL商城" href="main"><img width="182" height="60" title="ZOL商城" alt="ZOL商城" src="css_js/regist/shop_182x60.png"><p>E购商城</p></a>
                <!-- modify by hanjw 2014-6-24 --> </div>
            </div>
    </div>
    
    <div class="register-wrap clearfix">
        <div class="title">欢迎加入E购商城</div>
       <form id="J_RegisterForm" action="newAccount" method="post">
        <div class="register-module">                        
                                 
            <input type="hidden" value="1" name="J_register_type" id="J_register_type">
            <div class="register-phone-number" style="display:block;" id="J_register_phone">
                    <div class="register-form">
                        <div class="label"><em class="xh">*</em>用户名：</div>
                                                <input name="username" id="J_register_phone_number" type="text" class="text" maxlength="11">
                        <i class="right-tips" style="display: none"></i>
                        <div class="tips">请填写要注册的用户名</div>
                    </div> 
                    <div class="register-form">
                        <div class="label"><em class="xh">*</em>地址：</div>
                                                <input name="address" id="J_register_phone_number" type="text" class="text" maxlength="11">
                        <i class="right-tips" style="display: none"></i>
                        <div class="tips">请填写要注册的地址</div>
                    </div> 
                    <div class="register-form">
                        <div class="label"><em class="xh">*</em>手机号码：</div>
                                                <input name="mobile" id="J_register_phone_number" type="text" class="text" maxlength="11">
                        <i class="right-tips" style="display: none"></i>
                        <div class="tips">请填写要注册的手机号码</div>
                    </div>
                    <!-- 
                    <div class="register-form">
                        <div class="label"><em class="xh">*</em>验证码：</div>
                        <div class="email-captcha clearfix">
                            <input name="J_register_checkcode_phone" id="J_register_checkcode_phone" type="text" class="text">
                                                        <input name="J_register_checkcode_token_phone" id="J_register_checkcode_token_phone" type="hidden" value="1441773927381">
                                                        <span class="captcha-img"><img width="98" height="38" src="css_js/regist/captcha.php" alt="" id="J_Captcha-Img_phone"></span>
                            <a href="javascript:void(0)" class="captcha-change" id="J_Captcha-Img_Change_phone">换一张</a>
                        </div>
                        <i class="wrong-tips" style="display:none;margin-left:38px;" id="J_register_checkcode_tips_phone"></i>
                        <div class="tips">请填写图片验证码</div>
                    </div>       
                     -->
                                              
                    
                    
                    
                    <div class="register-form">
                        <div class="label"><em class="xh">*</em>密码：</div>
                                                <input name="password" id="J_register_pasword_phone" type="password" class="text">                      
                        <i class="wrong-tips" style="display:none;" id="J_register_pasword_phone_tips">密码不可以包含特殊字符</i>
                        <div class="tips">6-16位字母和数字的组合，不可用特殊字符</div>
                    </div>
                    
                    <div class="register-form">
                        <div class="label"><em class="xh">*</em>确认密码：</div>
                        <input name="repassword" id="J_register_regPasword_phone" type="password" class="text">
                        <i class="wrong-tips" style="display:none;" id="J_register_regPasword_phone_tips"></i>
                        <div class="tips">再次输入密码</div>
                    </div>     
                    <!-- 
                    <label class="agreement">                                            
                                            <input type="checkbox" value="1" name="J_regRead_phone" id="J_regRead_phone" checked="">同意<a href="http://help.zol.com/index.php?c=Detail&id=1019" target="_blank">《商城用户协议》</a><a href="http://help.zol.com/index.php?c=Detail&id=1022" target="_blank" class="xy_a">《隐私权说明》</a>
                                        </label>                    
                     -->                                     
                    <input name="J_register_phone_submit" type="submit" value="注册" class="register-btn" id="J_register_phone_submit">
                                        <span style="display:none" class="register-btn submit-loading" id="J_register_phone_loading">正在注册...</span>             
            </div>
            
            
        </div>
       </form>
    
    </div>
</body></html>
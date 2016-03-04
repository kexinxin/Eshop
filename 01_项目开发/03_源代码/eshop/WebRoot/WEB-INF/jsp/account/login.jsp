<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0022)https://login.zol.com/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <meta charset="gbk">
        <title>登录- E购商城</title>
        <link href="css_js/login/login.css" rel="stylesheet" type="text/css">
    </head>
    <body class="login-index">
        <div class="wrapper">
            <div class="header clearfix">
            <!-- register-bar add by hanjw 2014-6-24-->
            <div class="register-bar"><a href="register">立即注册</a>还没有E购商城账号？</div>
            <!-- //register-bar add by hanjw 2014-6-24-->
                    <div class="logo"> 
                <!-- modify by hanjw 2014-6-24 -->
                <a title="ZOL商城" href="main"><img width="182" height="60" title="ZOL商城" alt="ZOL商城" src="css_js/login/shop_182x60.png"><p>E购商城</p></a>
                <!-- modify by hanjw 2014-6-24 --> </div>
            </div>
            <form id="J_loginForm" action="login" method="post">
            <div class="login-wrap clearfix">
                <div class="ad-div">
                    <div>                        
                        <a href="#" target="_blank"><img width="520" height="350" src="css_js/login/ad.jpg" alt=""></a>                        
                    </div>
                </div>
                <div class="login-layer">
                    <div class="login-head">                                                       
                        <h3>登录E购商城</h3>   
                        <a href="intoAdminLogin">管理员登录</a>                     
                    </div>
                    <div class="login-content" id="J_login_common">
                        <div class="login-wrong-tips" id="J_login-wrong-tips" style="display:none;">-</div>
                        <div class="form-item username">
                            <input type="text" value="" autocomplete="off" placeholder="手机号/邮箱/用户名" class="text" id="J_loginUser" name="username" maxlength="100">
                            <i class="remove" style="display:none;"></i>
                            <ul style="display:none;" class="account-list" id="J_accountList">                                
                            </ul>
                        </div>
                        <div class="form-item">                            
                            <input type="password" autocomplete="off" placeholder="密码" class="text" id="J_loginPsw" maxlength="20" name="password">
                            <i class="remove" style="display:none;"></i> <span class="case-tips" id="J_loginCapsLock">大小写锁定已打开<i class="ico"></i></span> </div>
                         <input type="submit" value="登 录" class="login-layer-btn" id="J_loginBtn">
            
                    </div>
                     
                </div>
            </div>
            </form>    
        </div>   
        
      
    </div>
</div>


</body></html>
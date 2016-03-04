<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0041)http://my.zol.com/index.php?c=FollowGoods -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>关注商品-我的关注--买家中心</title>
<link href="./css_js/attention/public.css" rel="stylesheet" type="text/css">
<link href="./css_js/attention/foot.css" rel="stylesheet" type="text/css">
<link href="./css_js/attention/publicTips.css" rel="stylesheet" type="text/css">
<link href="./css_js/attention/score.css" rel="stylesheet" type="text/css">
<link href="./css_js/attention/ui.all.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- header start--> 
<!-- 公用导航 start -->
<%@ include file="../common/IncludeTop.jsp"%>

<!-- 公用导航 end --> 

<!-- header start-->
<div class="header">
  <div class="wrapper clearfix"> <a href="viewMyAccount" class="logo"></a>
    <div class="searchbox">
      <form action="searchProductList" method="GET" target="_blank" id="1243054104">
        <div class="searchmod">
          <input name="keyword" type="text" class="searchtext" placeholder="搜索商品/店铺" maxlength="50" autocomplete="off">
        </div>
        <input name="do_search" type="submit" value="搜索" class="searchbtn">
      </form>
    </div>
  </div>
</div>
<!-- header end--> <!-- header end-->
<div class="mainbody module clearfix"> 
  <!-- header end-->
  
 
  
  <div class="side">
    <h3><a href="viewMyAccount">买家中心</a></h3>
    <ul class="nav clearfix">
      <li> <a href="viewOrder">订单管理</a> </li>
      <li class="current"><span>我的关注</span></li>
      <li> <a href="viewMyAccount">个人信息</a> </li>
    </ul>
  </div>
  

  
  
  
  <div class="main">
    <div class="attention">
      <table class="attention-product-nav">
        <tbody>
          <tr>
            <td class="cell-1" style="width:380px;">商品信息</td>
            <td class="cell-2" style="width:174px;">价格（元）</td>
            <td class="cell-3" style="width:106px;">产品公司</td>
            <td class="cell-6" style="width:127px;">操作</td>
          </tr>
        </tbody>
      </table>
      <!-- 关注的商品内容 -->
      <div class="attention-box">
        <ul class="attention-list">
        <s:iterator value="#session.saveProductList" var="product1" status="status">
        <!-- ///////////////////////////////////////////////////////////////////////// -->
          <li class="first">
            <div class="attention-product clearfix">
              <div class="product clearfix" style="width:361px;"> <a href="viewProduct?productId=${product1.productId}" target="_blank" class="pic"> <img height="60" width="80" alt="" src="${product1.picture }"> </a>
                <div class="product-infor">
                  <h3><a href="viewProduct?productId=${product1.productId }" target="_blank">${product1.name }</a></h3>
                </div>
              </div>
              <div class="price" style="width:174px;"> ${product1.sellPrice} </div>
              <div class="time" style="width:106px;">${product1.company}</div>
              <div class="operate" style="width:108px;">
                <p><a href="deleteMySaveItem?index=${status.index } " fn="delFollowGoods" goodsid="24480533" class="btn4 mt">删除</a></p>
              </div>
            </div>
          </li>
          <!-- /////////////////////////////////////////// -->
        </s:iterator>
       </ul>
      </div>
      <!-- 关注的商品内容 end--> 
      
      <!--当没有上一页时 将上一页去掉 下一页同理-->
      <div class="page-num"> <span class="sel">1</span> </div>
    </div>
  </div>
</div>

<!--底部--> 

</div>
</body>
</html>
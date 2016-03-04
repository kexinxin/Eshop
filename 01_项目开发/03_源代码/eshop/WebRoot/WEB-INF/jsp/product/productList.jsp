<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0061)http://www.zol.com/cell_phone/list/c34_s57.html?spm=625.34430 -->
<html>
<head>
<title>【手机】产品报价大全-E购商城</title>
<link href="css_js/productList/main_v1.css" rel="stylesheet" type="text/css">
<link href="css_js/productList/head_foot.css" rel="stylesheet" type="text/css">
<link rel="icon" href="http://icon.zol-img.com.cn/zol_shop/favicon.ico" type="image/icon">
<link rel="shortcut icon" href="http://icon.zol-img.com.cn/zol_shop/favicon.ico" type="image/icon">
<link href="css_js/productList/side_toolbar.css" rel="stylesheet" type="text/css">
<link href="http://icon.zol-img.com.cn/newshop/login/shopLoginBox.css" rel="stylesheet">
<script src="css_js/productList/jquery-1.8.1.js"></script>
<script src="css_js/productList/cookie.js"></script>
<style>
.commonly label {
	margin: -1px 7px 0 0;
	white-space: nowrap;
	_margin: -1px 7px 0 0;
	margin: -1px 10px 0 0\0;
}
.commonly .line {
	padding: 0 15px;
}
.commonly label span {
	display: inline-block;
}
.commonly .check {
 +margin:1px 0 0;
	_margin: 0;
}
.z-security, .green-channel {
	padding: 0 0 0 20px;
	background: url(http://icon.zol-img.com.cn/newshop/shop/list/list_v1/zproduct.png) no-repeat;
}
.z-security {
	background-position: 0 0;
}
.green-channel {
	background-position: 0 -30px;
}
.container .service .z-security {
	display: block;
	margin: -2px 0 0 8px;
	text-indent: 0;
	color: #333;
}
.container .service .green-channel {
	display: block;
	margin: -2px 0 0 4px;
	width: 16px;
	height: 22px;
	padding: 0;
}
.container .service .z-security:hover {
	color: #f60;
}
.more-selected {
	height: auto;
	padding-bottom: 8px
}
.selectebox > div {
	display: none;
}
</style>
<script type="text/javascript" async="" charset="utf-8" src="css_js/productList/zgc_list.js"></script>
</head>
<body>
<link href="css_js/productList/topbar.css" rel="stylesheet" type="text/css">
	<%@ include file="../common/IncludeTop.jsp"%>
	<div class="header clearfix">
  <div class="logo">
    <h1><a title="中关村商城" href="main" class="mall-logo"></a></h1>
    <p>E购商城</p>
  </div>
  <div class="search-box">
    <form action="searchProductList" method="get" name="serachForm" id="searchFrom">
      <div class="search">
        <input name="keyword" type="text" class="search-text" value="">
        <input type="submit" value="搜 索" class="search-btn" hidefocus="true">
      </div>
    </form>
  </div>
</div>
<div class="navbar">
  <div class="navmod">
    <ul class="mainnav clearfix">
      <li><a href="viewChildCategoryProductList?category.categoryId=9"><center>平板</center></a></li>
      <li><a href="viewChildCategoryProductList?category.categoryId=1" ><center>手机</center></a></li>
      <li><a href="viewChildCategoryProductList?category.categoryId=2" ><center>笔记本</center></a></li>
      <li><a href="viewChildCategoryProductList?category.categoryId=7" ><center>数码相机</center></a></li>
      <li><a href="viewChildCategoryProductList?category.categoryId=8" ><center>耳机</center></a></li>
    </ul>
  </div>
</div>
<div class="wrapper clearfix">
	<center>
  	<div class="main">
    <div class="category-nav">
      <div class="filter">
        <div class="toolbar clearfix">         
          <div class="prop-item brand-imglist " style="display: block;">
            <dl>
              <dt>品牌：</dt>
              <dd>
                <div class="brand-inner">
                  <div class="brandlist">
                    <ul class="clearfix" id="brands">
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="华为,huawei"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=华为" title="华为"> 华为<img width="80" height="40" src="css_js/productList/Cg-4WFQ5AcmIIJmEAAApQ09JdQIAAQBKgNvU1gAAClb357.jpg" ></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="三星,samsung" class=""> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=三星" title="三星"> 三星<img width="80" height="40" src="css_js/productList/Cg-4V1QbiS-IV44IAAA3WloeDLQAAPMBAEx7uIAADdy705.jpg" ></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="小米,xiaomi" class=""> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=小米" title="小米"> 小米<img width="80" height="40" src="css_js/productList/Cg-4WFQ492WIVf3iAAAvNXaaXDwAAQBEQNK9ZkAAC9N625.jpg" ></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="魅族,meizu"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=魅族" title="魅族"> 魅族<img width="80" height="40" src="css_js/productList/Cg-4WFQ5B62IDezYAAAkaFbmi2kAAQBNQO5MwQAACSA334.jpg" ></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="HTC,htc"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=HTC" title="HTC"> HTC<img width="80" height="40" src="css_js/productList/Cg-4WFQ5AbeIIC1wAAAdGn1-BZUAAQBKgLYVEwAAB0y514.jpg" ></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);"  manuname="联想,lenovomobile"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=联想" title="联想"> 联想<img width="80" height="40" src="css_js/productList/Cg-4V1Q5FYCIV7zQAAAXws0Nhw4AAQBTgClVxoAABfa751.jpg" ></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="酷派,coolpad"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=酷派" title="酷派"> 酷派<img width="80" height="40" src="css_js/productList/Cg-4V1QachiIOxVxAAACbZi3xWoAAO-tgDQUzcAAAKF782.png" alt=""></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="苹果,apple" > <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=Apple" title="苹果"> 苹果<img width="80" height="40" src="css_js/productList/Cg-4WFQ491mIKZ5WAAALECkG5eIAAQBEQMdKRYAAAso635.jpg" alt=""></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="中兴,zte" class=""> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=中兴" title="中兴"> 中兴<img width="80" height="40" src="css_js/productList/Cg-4V1Q5FV-IO23gAAAnQshZxdQAAQBTwPDno8AACda151.jpg" alt=""></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="飞利浦,philips" class=""> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=飞利浦" title="飞利浦"> 飞利浦<img width="80" height="40" src="css_js/productList/Cg-4WFQ5FJuIEIRwAAAwof1ohywAAQBTQO5TxsAADC5905.jpg" alt=""></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname=""> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=大神" title="大神"> 大神</a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="努比亚,Nubia"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=努比亚" title="努比亚"> 努比亚<img width="80" height="40" src="css_js/productList/Cg-4WFQ5AhSIFBbKAAAk_sbVJOUAAQBKwDL768AACUW484.jpg" alt=""></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="OPPO,oppo"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=OPPO" title="OPPO"> OPPO<img width="80" height="40" src="css_js/productList/Cg-4V1Q5FVCIWZ7RAAAnhQFBh10AAQBTwNdhBQAACed855.jpg" alt=""></a></li>
                      <li   onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" manuname="诺基亚,nokia"> <a href="searchProductListByConpany?categoryId=${sessionScope.categoryId } &canpany=诺基亚" title="诺基亚"> 诺基亚<img width="80" height="40" src="css_js/productList/Cg-4WFQ5Ah-IILt4AAA25kZ3dtgAAQBKwD6ogcAADb-247.jpg" alt=""></a></li>
                    </ul>
                    <script type="text/javascript">
						function onMouseOver(id){
							id.style.border="1px solid #C00";
							id.style.margin="-1px 0px 0px -1px";
						}
						function onMouseOut(id){
							id.style.borderTop="none";
							id.style.borderLeft="none";
							id.style.borderRight="1px solid #ebebeb";
							id.style.borderBottom="1px solid #ebebeb";
							id.style.margin="0px";
						}
						
					</script>
                  </div>
                </div>
              </dd>
            </dl>
          </div>
          <div class="prop-item" style="display: block;">
            <dl>
              <dt>价格：</dt>
              <dd>
                <ul>
                  <li><a href="viewProductByPrice?categoryId=${sessionScope.categoryId } &price=500" title="500元以下">500元以下</a></li>
                  <li><a href="viewProductByPrice?categoryId=${sessionScope.categoryId } &price=1000" title="500-1000元">500-1000元</a></li>
                  <li><a href="viewProductByPrice?categoryId=${sessionScope.categoryId } &price=1500" title="1000-1500元">1000-1500元</a></li>
                  <li><a href="viewProductByPrice?categoryId=${sessionScope.categoryId } &price=2000" title="1500-2000元">1500-2000元</a></li>
                  <li><a href="viewProductByPrice?categoryId=${sessionScope.categoryId } &price=3000" title="2000-2500元">2000-3000元</a></li>
                  <li><a href="viewProductByPrice?categoryId=${sessionScope.categoryId }&price=4000" title="2500-3000元">3000-4000元</a></li>
                  <li><a href="viewProductByPrice?categoryId=${sessionScope.categoryId } &price=5000" title="3000-4000元">4000元以上</a></li>
                </ul>
              </dd>
            </dl>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <ul class="goods-list clearfix" id="goodsPicList">
      	<s:iterator value="#session.pageProductList" var="product" status="item">
      		<li> 
	          <!--<i class="ico">Z+商品</i>--> 
	          <a href="viewProduct?product.productId=${product.productId }" class="pic" > <span class="img"><img width="200"  alt="${product.name }" title="${product.name }" src="${product.picture }" shid="1" style="opacity: 1;"></span> <span class="title">${product.name }</span> </a>
	          <div class="price-bar clearfix">
	            <div class="price">${product.sellPrice }</div>
	          </div>
       		</li>
      	</s:iterator>
        
      </ul>
    </div>
    <div class="page">
    	
    	<%
    		int pages = (Integer) session.getAttribute("pages");
    		int currentPage =(Integer) session.getAttribute("currentPage");
    		if(pages!=0){
    			out.println("<a href=\"pageChange?prePage=-1\" class=\"next\">上 一页</a>");
	    		for(int i=0;i<pages;i++){
	    			if(i+1==currentPage)
	    				out.println("<span class=\"current\">"+(i+1)+"</span>");
	    			else
	    				out.println("<a href=\"pageChange?prePage="+(i+1)+"\">"+(i+1)+"</a>");
	    		}
	    		out.println("<a href=\"pageChange?prePage=-2\" class=\"next\">下一页</a>");
    		}
    	%>
    </div>
  	</div>
	</center>
</div>
<div class="footer">
<div class="wrapper">
  <div class="footer-service-relate clearfix">
    <dl class="cooperation">
    </dl>
  </div>
</div>
<div class="footer-nav-bar"> </div>
</body>
</html>
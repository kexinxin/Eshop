<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
    <!DOCTYPE html>
    <!-- saved from url=(0019)http://www.zol.com/ -->
    <html><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <meta charset="gbk">
    <title>E购商城    易购,放心购</title>
    <meta name="keywords" content="ZOL商城,中关村商城,笔记本,手机,数码相机,数码影音,DIY硬件">
    <meta name="description" content="ZOL商城,中关村商城（zol.com）具备在3年内成长为中国最大的3C电子商城之潜力，源于中国IT行业第一垂直媒体（zol.com.cn）在IT及互联网行业已臻十年的深厚积累。运营核心，只为了给用户打造一个放心、省心、舒心的购物平台！">
    <link href="./css_js/main/public.css" rel="stylesheet">
    <link href="./css_js/main/zolcom_index.css" rel="stylesheet">
    <link href="./css_js/main/feedBack.css" rel="stylesheet" type="text/css">
    <link href="./css_js/main/shopLoginBox.css" rel="stylesheet">
    <link href="./css_js/main/side_toolbar.css" rel="stylesheet" type="text/css">
    <script src="./css_js/main/jquery-1.8.1.js"></script>
    <style>
    /*防止IE6顶部固定导航闪动所加样式*/
    *html{
        background-image:url(about:blank);
        background-attachment:fixed;
    }
    .none{display: none;}
    </style>
    <link rel="icon" href="http://icon.zol-img.com.cn/zol_shop/favicon.ico" type="image/icon">
    <link rel="shortcut icon" href="http://icon.zol-img.com.cn/zol_shop/favicon.ico" type="image/icon"> 
</head>
<body>
    <!-- 公共头部 -->
    <%@ include file="../common/IncludeTop.jsp"%>
    <script>    var Z_now_time = "1441686243";    var z_user_id  = "";    function showUI(obj){        var className = obj.className;        if(className == "zc-my-center"){            obj.className = "zc-my-center zc-hover";            document.getElementById("zc-my-center-bd").style.display="block";        }else if(className == "zc-mobile"){            obj.className = "zc-mobile zc-hover";            document.getElementById("zc-mobile-bd").style.display="block";        }else{            obj.parentNode.className = "lianxikefu zc-hover";            obj.nextSibling.style.display = "block";        }    }        function hideUI(obj){        var className = obj.className;        if(className == "zc-my-center zc-hover"){            obj.className = "zc-my-center";            document.getElementById("zc-my-center-bd").style.display="none";        }else if(className == "zc-mobile zc-hover"){            obj.className = "zc-mobile";            document.getElementById("zc-mobile-bd").style.display="none";        }else{            obj.parentNode.className = "lianxikefu";            obj.nextSibling.style.display = "none";        }    }        function getApiNumber(){        var xmlHttp = null;        if (window.XMLHttpRequest) {            xmlHttp = new XMLHttpRequest();        } else {            if (window.ActiveXObject) {                xmlHttp = new ActiveXObject("Microsoft.XMLHttp");            }        }        var url="http://www.zol.com/index.php?c=Ajax_Topbar&t="+Math.random();        xmlHttp.open("GET",url,false);        xmlHttp.send(null);        var responseHtml = "";        if(xmlHttp.readyState == 4){            if(xmlHttp.status = 200){                responseHtml = eval(" ( " + xmlHttp.responseText + " ) ");            }        }        if("" != responseHtml && "object" == typeof(responseHtml)){            document.getElementById("shop-cart-num").innerHTML = "购物车"+responseHtml.cartNumber+"件";            document.getElementById("focusShopNum").innerHTML  = responseHtml.shopNumber;            document.getElementById("focusGoodsNum").innerHTML = responseHtml.goodsNumber;        }    }    getApiNumber();
    </script>
    <div class="header clearfix">   
        <div class="logo">
            <h1><a title="ZOL商城" href="main" class="mall-logo"></a></h1>
            <p>E购商城</p>
        </div>    
        <div class="search-box">
			<form action="searchProductList" method="get">
				<div class="search">
					<input name="keyword" type="text" class="search-text" id="keyword"
						value=""> <input type="submit" value="搜 索"
						class="search-btn" hidefocus="true">
				</div>
			</form>
		</div>
        
    </div>
    <div class="nav-box">
        <div class="category-nav-container">
            <h2 class="category-nav-title">商品分类</h2>
            <div class="category-menu-nav">
                <ul class="menu-nav-container">
                
                
                	<s:iterator value="categoryList">
                		
                    <li  >
                        <div class="item">
                            <i class="iconfont iconfont-phone"></i>
                            <a href="viewChildCategoryProductList?category.categoryId=<s:property value="categoryId" />">  <s:property value="name" /> </a>
                   
                        </div>                                
                        <div class="category-menu-content category-1">                      
                            <dl>
                                <dt><a href="http://www.zol.com/cell_phone/list/c34_s57.html?spm=625.34430" target="_blank">手机</a></dt>
                                <dd>
                                    <p>
                                    	<s:iterator value="childCategory">
                                    	
                                        <a href="viewParentCategoryProductList?categoryId=<s:property value="categoryId" />"  ><s:property value="name" /></a>
                                    	</s:iterator>
                                        
                                    </p>                            
                                                                                            
                                </dd>
                            </dl>   
                        </div>
                    </li>
                    
                	</s:iterator>
      
                </ul>
            </div>                
            <div class="ad-div"></div>
        </div>
        
    </div>
    <!-- //公共头部 -->
    
    <div class="wrapper clearfix">
        <div class="side">
            <div class="module mall-notice">
                <div class="module-title">商城公告</div>
                <ul>
                    <li><a href="viewProduct?product.productId=1" target="_blank">iphone6 只要4588</a></li>
                    <li><a href="viewProduct?product.productId=13" target="_blank">新款联想电脑Y50-Y70</a></li>
                    <li><a href="viewProduct?product.productId=52" target="_blank">卖苹果送“苹果”</a></li>
                    <li><a href="viewProduct?product.productId=56" target="_blank">微软surface新品</a></li>
                    <li><a href="viewProduct?product.productId=81" target="_blank">抢、抢、抢魅蓝首发！</a></li>
                </ul>
            </div>
        </div>

        <div class="focus-box">
            <div class="focus-inner">
                <ul id="indexFocusUl" style="left: -2960px;">
                    <li>
                        <a href="viewProduct?product.productId=1" target="_blank">
                            <img width="740" height="400" src="./css_js/main/ChMkJlX6mmiIQ0ptAAIdF-9xU0oAACuvAC3oK8AAh0v150.jpg" alt="Z爆款 碳金500">
                        </a>
                    </li>
                    <li>
                        <a href="viewProduct?product.productId=6" target="_blank">
                            <img width="740" height="400" src="./css_js/main/ChMkJ1XuPHiIT6mQAAH7mnuHZygAACYfgDdon4AAfuy428.jpg" alt="教师节特惠专场">
                        </a>
                    </li>
                    <li>
                        <a href="viewProduct?product.productId=6" target="_blank">
                            <img width="740" height="400" src="./css_js/main/ChMkJlXuQBSIGI0NAAIyLYKc56oAACYiAPM7iYAAjJF613.jpg" alt="一加手机2">
                        </a>
                    </li>
                    <li>
                        <a href="viewProduct?product.productId=113" target="_blank">
                            <img width="740" height="400" src="./css_js/main/T1XYhvBXxv1RXrhCrK.jpg" alt="影驰芒果盒子">
                        </a>
                    </li>
                    <li>
                        <a href="viewProduct?product.productId=6" target="_blank">
                            <img width="700" height="400" src="./css_js/main/2d658d7c01983a0f33631127c64ad626.jpg" alt="购任性 抢韩货">
                        </a>
                    </li>
                    <li>
                        <a href="viewProduct?product.productId=6" target="_blank">
                            <img width="740" height="400" src="./css_js/main/ChMkJlXXXmCIUf7GAAHzhQ0_qicAAAZQwNe_MIAAfOd740.jpg" alt="3D-box 震撼发布">
                        </a>
                    </li>
                </ul>
            </div>
            <a href="javascript:void(0)" class="focus-prev-btn" rel="1" type="prev" page="4" number="6" id="indexFocusPrev" style="display: none;"><span><i></i></span></a>
            <a href="javascript:void(0)" class="focus-next-btn" rel="1" type="next" page="4" number="6" id="indexFocusNext" style="display: none;"><span><i></i></span></a>
            <div class="focus-switch" id="indexFocusSpan" rel="1">
                <span class="" rel="0">1</span>
                <span rel="1" class="">2</span>
                <span rel="2" class="">3</span>
                <span rel="3" class="">4</span>
                <span rel="4" class="current">5</span>
                <span rel="5">6</span>
            </div>
        </div>
    </div>
    <div class="wrapper">
        
        <div class="section mobile-section">
            <div class="section-title clearfix">
                <h2 class="title">1F 手机通讯</h2>
                <p class="more">
                    <a href="viewProduct?product.productId=6" target="_blank">魅蓝note2</a>
                    |<a href="viewProduct?product.productId=1" target="_blank">华为荣耀6 Plus</a>
                    |<a href="viewProduct?product.productId=1" target="_blank">努比亚Z9</a>
                    |<a href="viewProduct?product.productId=6" target="_blank">魅蓝note</a>
                </p>
            </div>
            <div class="clearfix">
                <div class=" main-figure"><a href="viewProduct?product.productId=1" title="开学季 抢特惠手机" target="_blank"><img width="360" height="420" src="./css_js/main/ChMkJ1XdbgyIZ8YuAAFN1mkdCUcAABAOwKTP-YAAU3u798.jpg" alt="开学季 抢特惠手机"></a></div>
                <ul class="figure-list clearfix">
                    <li class="item wide">
                        <div class="focus-box">
                            <div class="focus-inner">
                                <ul id="mobileFocusUl" style="left: -419px;">                                                            
                                    <li><a href="viewProduct?product.productId=1" target="_blank"><img width="419" height="209" src="./css_js/main/Cg-4WVWLpwqIVGt3AAE6l83BOLQAAF9PgMX0xcAATqv759.jpg" alt="魅族MX4"></a></li>
                                    <li><a href="viewProduct?product.productId=1" target="_blank"><img width="419" height="209" src="./css_js/main/ChMlWVXK_UGIEPtbAADCmCMBgnMAAHsNQP2bJ0AAMKw833.jpg" alt="华为P8MAX"></a></li>
                                    <li><a href="viewProduct?product.productId=1" target="_blank"><img width="419" height="209" src="./css_js/main/ChMlWVW4P_2IOibbAAEv3Kt7XFMAAHxSwEhyqMAAS_0939.jpg" alt="三星S6"></a></li>
                                </ul>
                            </div>
                            <a href="javascript:void(0)" class="focus-prev-btn" rel="2" type="prev" page="1" number="3" id="mobileFocusPrev"><span><i></i></span></a>
                            <a href="javascript:void(0)" class="focus-next-btn" rel="2" type="next" page="1" number="3" id="mobileFocusNext"><span><i></i></span></a>                                                                   
                            <div class="focus-switch" id="mobileFocusSpan" rel="2">
                                <span rel="0" class=""></span>
                                <span rel="1" class="current"></span>
                                <span rel="2" class=""></span>
                            </div>
                        </div>
                    </li>
                    <li class="item tall">
                        <div class="title"><a href="viewProduct?product.productId=1" target="_blank">苹果iPhone 6 全网通</a></div>
                        <p>买就送高清膜大礼包</p>
                        <a href="viewProduct?product.productId=1" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMkJ1XkPu-IN6BFAABPiiqnkK0AACGNQM6RLYAAE-i916.jpg" alt="苹果iPhone 6 全网通"></a>
                    </li>                                
                    <li class="item tall">
                        <div class="title"><a href="viewProduct?product.productId=1" target="_blank">三星GALAXY S6 全网通</a></div>
                        <p>送9800毫安电源 钢化膜 原厂保护壳</p>
                        <a href="viewProduct?product.productId=1" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMkJ1XkPluIGzwYAABCB0UN_OMAACGNAMDd4kAAEIf746.jpg" alt="三星GALAXY S6 全网通"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=1" target="_blank">华为 荣耀7 移动4G</a></div>
                        <p>双卡双待双通 高性价比</p>
                        <a href="viewProduct?product.productId=1" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMkJ1XdJUqIMQBZAAA0nsYYeyoAAA5NgKtMlgAADS2702.jpg" alt="华为 荣耀7 移动4G"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=1" target="_blank">魅蓝2新品 双卡双待</a></div>
                        <p>1300W像素 有现货</p>
                        <a href="viewProduct?product.productId=1" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMlWlXJaGmIUX1rAABHQqGZKQsAAHpHwJj7gYAAEda650.jpg" alt="魅蓝2新品 双卡双待"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=1" target="_blank">乐视 超级手机1 双4G</a></div>
                        <p>跑分帝 快的令人窒息</p>
                        <a href="viewProduct?product.productId=1" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMkJ1XdJZOIM_9rAAAo5hHtTiYAAA5PwLXEVkAACj-333.jpg" alt="乐视 超级手机1 双4G"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=1" target="_blank">小米 红米Note2（移动4G）</a></div>
                        <p>千元旗舰 现货送好礼</p>
                        <a href="viewProduct?product.productId=1" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMkJlXVQ3aIGHxjAAAzvQgi8ecAAAUyQMlapcAADPV825.gif" alt="小米 红米Note2（移动4G）"></a>
                    </li>                                
                </ul>
            </div>
                             
            <!-- 张威的需求 -->
            
        </div>  
        <div class="section nb-section">
            <div class="section-title clearfix">
                <h2 class="title">2F 电脑数码/配件</h2>
                <p class="more">
                    <a href="viewProduct?product.productId=10" target="_blank">iPad</a>
                    |<a href="viewProduct?product.productId=10" target="_blank">联想Y50</a>
                    |<a href="viewProduct?product.productId=10" target="_blank">尼康D750</a>
                    |<a href="viewProduct?product.productId=10" target="_blank">佳能70D</a>
                </p>
            </div>
            <div class="clearfix">          
                <div class=" main-figure"><a href="viewProduct?product.productId=10" title="佳能超薄卡片机" target="_blank"><img width="360" height="420" src="./css_js/main/ChMlWlXK_SSIRK1PAAC_PTrQlAMAAHsNQMMyIEAAL9V377.jpg" alt="佳能超薄卡片机"></a></div>
                <ul class="figure-list clearfix">
                    <li class="item wide">
                        <div class="focus-box">
                            <div class="focus-inner">
                                <ul id="computerFocusUl" style="left: -419px;">                                                                                                                
                                    <li><a href="viewProduct?product.productId=10" target="_blank"><img width="419" height="209" src="./css_js/main/ChMkJlXkIPuIa9D8AAFEqwUwKUgAACF7QPWxkgAAUTD667.jpg" alt="华硕FX50游戏笔记本"></a></li>
                                    <li><a href="viewProduct?product.productId=10" target="_blank"><img width="419" height="209" src="./css_js/main/ChMkJlXkIDmITESmAAFz2fKdNC0AACF7AFodU0AAXPx896.jpg" alt="佳能EOS760D单反"></a></li>
                                    <li><a href="viewProduct?product.productId=10" target="_blank"><img width="419" height="209" src="./css_js/main/ChMkJlXkIAaIM1oSAAEDT-XedkcAACF6wLeFN4AAQNn584.jpg" alt="佳能50MM F1.8 stm定焦镜头"></a></li>
                                </ul>            
                            </div>
                            <a href="javascript:void(0)" class="focus-prev-btn" rel="3" type="prev" page="1" number="3" id="computerFocusPrev"><span><i></i></span></a>
                            <a href="javascript:void(0)" class="focus-next-btn" rel="3" type="next" page="1" number="3" id="computerFocusNext"><span><i></i></span></a>                                                                 
                            <div class="focus-switch" rel="3" id="computerFocusSpan">
                                <span rel="0" class=""></span>
                                <span rel="1" class="current"></span>
                                <span rel="2" class=""></span>
                            </div>
                        </div>
                    </li>
                    <li class="item tall">
                        <div class="title"><a href="viewProduct?product.productId=10" target="_blank">神舟 战神 K610D</a></div>
                        <p>GT840M 独显游戏本</p>
                        <a href="viewProduct?product.productId=10" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMkJlXcQXSIalBXAADT0ivj1iUAAAk_wCIrggAANPq196.jpg" alt="神舟 战神 K610D"></a>
                    </li>                                
                    <li class="item tall">
                        <div class="title"><a href="viewProduct?product.productId=10" target="_blank">8英寸平板 32G内存</a></div>
                        <p>Win10安卓双系统 包顺丰</p>
                        <a href="viewProduct?product.productId=10" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMlWVXK38qINA5oAABXqw9Q6LcAAHr5gKWmdoAAFfD494.jpg" alt="8英寸平板 32G内存"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=10" target="_blank">超薄游戏本 2G独显</a></div>
                        <p>赠保护膜等四件套</p>
                        <a href="viewProduct?product.productId=10" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMlWlXK35iIW6-eAAA4pqbDfLwAAHr5gBl1X0AADi-171.jpg" alt="超薄游戏本 2G独显"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=10" target="_blank">单反含18-135mm头</a></div>
                        <p>赠清洁套装 镜头纸</p>
                        <a href="viewProduct?product.productId=10" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMlWlXK31yIVHjJAABqbE-L8-4AAHr5QE622kAAGqE072.jpg" alt="单反含18-135mm头"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=10" target="_blank">15寸大屏 2G独显</a></div>
                        <p>4G内存 四核处理器</p>
                        <a href="viewProduct?product.productId=10" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMlWVXK3y2ISTzpAAA1oYiigHcAAHr5ALUQOoAADW5213.jpg" alt="15寸大屏 2G独显"></a>
                    </li>                                
                    <li class="item ">
                        <div class="title"><a href="viewProduct?product.productId=10" target="_blank">37°智能手环 测血压</a></div>
                        <p>关注健康 仅售￥99</p>
                        <a href="viewProduct?product.productId=10" class="pic" target="_blank"><img width="160" height="120" src="./css_js/main/ChMlWlXK3viIQap_AABOzhc-kqQAAHr5AGyLuMAAE7m080.jpg" alt="37°智能手环 测血压"></a>
                    </li>                                
                </ul>
            </div>
                             
        </div>  
        
        
    </div>  
    
    <div class="footer">
        <div class="footer-nav-bar">
            <div class="wrapper">
            </div>
        </div>
    </div>
    <form action="http://www.zol.com/index.php" method="get" id="zsSearch">
        <input type="hidden" name="c" value="List">    
        <div class="search-layer" id="search_layer_fixed" style="display:none;">
            <div class="wrapper clearfix">
                <a href="./css_js/main/ZOL商城(ZOL.COM)-中国最大3C网络电子商城｜正品低价 放心购.htm" class="logo"><img src="./css_js/main/logo_157x32.png" width="157" height="32"></a>
                <div class="search-box">
                    <div class="search">
                        <input name="keyword" type="text" class="search-text" value="">
                        <input type="submit" value="搜 索" class="search-btn" hidefocus="true">
                    </div>
                </div>
            </div>
        </div>
    </form>    
    
    
    <script src="./css_js/main/ExcellentFeedBack.js"></script>
    <script>
            // 限时抢购倒计时
            // 焦点图特效
            $.extend({
                promoClock: function (classId, endTime, nowTime) {
                    var leave = endTime - nowTime;
                    var lastTime = '';
                    if (leave <= 0) {
                        var lastTime = "抢购已结束";
                    } else {
                        var hour = Math.floor(leave / 3600);
                        var minute = Math.floor(leave / 60) - (hour * 60);
                        var second = leave - (hour * 3600) - (minute * 60);
                        hour = hour < 10 ? "0" + hour : hour;
                        minute = minute < 10 ? "0" + minute : minute;
                        second = second < 10 ? "0" + second : second;
                        lastTime = '距抢购结束<em>' + hour + '</em>小时<em>' + minute + '</em>分<em>' + second + '</em>秒';
                        $('#' + classId).html(lastTime);
                        endTime--;
                        setTimeout("$.promoClock('" + classId + "', '" + endTime + "', '" + nowTime + "')", 1000);
                    }
                }
            });
    var adTimer1 = adTimer2 = adTimer3 = adTimer4 = adTimer5 = null;
    var currslid1 = currslid2 = currslid3 = currslid4 = currslid5 = 1;
    function showImg(currslid, imgDiv, adWidth) {
        if (!currslid) {
            $("#" + imgDiv + "Ul").stop(true, false).animate({left: -adWidth * currslid}, 500);
        } else {
            $("#" + imgDiv + "Ul").stop(true, false).animate({left: -adWidth * currslid}, 500);
        }
        $("#" + imgDiv + "Span > span:eq(" + currslid + ")").addClass("current").siblings().removeClass("current");
        $("#" + imgDiv + "Next").attr({'page': currslid});
        $("#" + imgDiv + "Prev").attr({'page': currslid});
    }
    function playIt(imgType) {
        var imgType = parseInt(imgType);
        var adWidth = 419;
        switch (imgType) {
            case 1:
            var adWidth = 740;
            var courrLen = $("#indexFocusSpan > span").length;
            if (courrLen > 1) {
                adTimer1 = setInterval(function () {
                    showImg(currslid1, 'indexFocus', adWidth);
                    currslid1++;
                    if (currslid1 >= courrLen) {
                        currslid1 = 0;
                    }
                }, 3000);
            }
            break;
            case 2:
            var courrLen = $("#mobileFocusSpan > span").length;
            if (courrLen > 1) {
                adTimer2 = setInterval(function () {
                    showImg(currslid2, 'mobileFocus', adWidth);
                    currslid2++;
                    if (currslid2 == courrLen) {
                        currslid2 = 0;
                    }
                }, 3000);
            }
            break;
            case 3:
            var courrLen = $("#computerFocusSpan > span").length;
            if (courrLen > 1) {
                adTimer3 = setInterval(function () {
                    showImg(currslid3, 'computerFocus', adWidth);
                    currslid3++;
                    if (currslid3 == courrLen) {
                        currslid3 = 0;
                    }
                }, 3000);
            }
            break;
            case 4:
            var courrLen = $("#digitalFocusSpan > span").length;
            if (courrLen > 1) {
                adTimer4 = setInterval(function () {
                    showImg(currslid4, 'digitalFocus', adWidth);
                    currslid4++;
                    if (currslid4 == courrLen) {
                        currslid4 = 0;
                    }
                }, 3000);
            }
            break;
            case 5:
            var courrLen = $("#diyFocusSpan > span").length;
            if (courrLen > 1) {
                adTimer5 = setInterval(function () {
                    showImg(currslid5, 'diyFocus', adWidth);
                    currslid5++;
                    if (currslid5 == courrLen) {
                        currslid5 = 0;
                    }
                }, 3000);
            }
            break;
        }
    }
    function stopIt(imgType) {
        imgType = parseInt(imgType);
        switch (imgType) {
            case 1:
            clearInterval(adTimer1);
            break;
            case 2:
            clearInterval(adTimer2);
            break;
            case 3:
            clearInterval(adTimer3);
            break;
            case 4:
            clearInterval(adTimer4);
            break;
            case 5:
            clearInterval(adTimer5);
            break;
        }
    }
    $(function () {
                // 限时抢购时间显示
                $(".flash-sale-list li").hover(function () {
                    $(this).addClass('hover');
                }, function () {
                    $(this).removeClass('hover');
                });
                // 限时抢购倒计时
                $.promoClock('promoCoutDown0', '1441870448', Z_now_time);
                $.promoClock('promoCoutDown1', '1441771199', Z_now_time);
                $.promoClock('promoCoutDown2', '1441775352', Z_now_time);
                $.promoClock('promoCoutDown3', '1441771199', Z_now_time);
                $.promoClock('promoCoutDown4', '1441773795', Z_now_time);
                // 楼层品牌
                $(".brands-list > li").hover(function () {
                    $(this).addClass('hover');
                }, function () {
                    $(this).removeClass('hover');
                });
                // 焦点图
                playIt(1);
                playIt(2);
                playIt(3);
                playIt(4);
                playIt(5);
                $(".focus-switch > span").mouseover(function () {
                    var imgType = $(this).parent().attr('rel');
                    imgType = parseInt(imgType);
                    var imgDiv = '';
                    var adWidth = 419;
                    currslid = parseInt($(this).attr("rel"));
                    switch (imgType) {
                        case 1:
                        currslid1 = currslid;
                        imgDiv = 'indexFocus';
                        adWidth = 740;
                        break;
                        case 2:
                        currslid2 = currslid;
                        imgDiv = 'mobileFocus';
                        break;
                        case 3:
                        currslid3 = currslid;
                        imgDiv = 'computerFocus';
                        break;
                        case 4:
                        currslid4 = currslid;
                        imgDiv = 'digitalFocus';
                        break;
                        case 5:
                        currslid5 = currslid;
                        imgDiv = 'diyFocus';
                        break;
                    }
                    showImg(currslid, imgDiv, adWidth);
                    stopIt(imgType);
                    $(this).addClass('current').siblings().removeClass('current');
                }).mouseleave(function () {
                    var imgType = $(this).parent().attr('rel');
                    playIt(imgType);
                });
                var isIE = navigator.userAgent.indexOf("MSIE 6.0") === -1 ? 0 : 1;
                if (!isIE) {
                    $(".focus-box").mouseenter(function () {
                        $(this).children(".focus-prev-btn").show();
                        $(this).children(".focus-next-btn").show();
                    }).mouseleave(function () {
                        $(this).children(".focus-prev-btn").hide();
                        $(this).children(".focus-next-btn").hide();
                    });
                }
                $(".focus-prev-btn, .focus-next-btn").click(function () {
                    var imgType = $(this).attr('rel');
                    imgType = parseInt(imgType);
                    var courrLen = parseInt($(this).attr('number'));
                    var currslid = parseInt($(this).attr('page'));
                    var clickType = $(this).attr('type');
                    if ('next' == clickType) {
                        if ((currslid + 1) >= courrLen) {
                            currslid = 0;
                        } else {
                            currslid++;
                        }
                    } else {
                        if (!currslid) {
                            currslid = (courrLen - 1);
                        } else {
                            currslid--;
                        }
                    }
                    var imgDiv = '';
                    var adWidth = 419;
                    switch (imgType) {
                        case 1:
                        currslid1 = currslid;
                        imgDiv = 'indexFocus';
                        adWidth = 740;
                        break;
                        case 2:
                        currslid2 = currslid;
                        imgDiv = 'mobileFocus';
                        break;
                        case 3:
                        currslid3 = currslid;
                        imgDiv = 'computerFocus';
                        break;
                        case 4:
                        currslid4 = currslid;
                        imgDiv = 'digitalFocus';
                        break;
                        case 5:
                        currslid5 = currslid;
                        imgDiv = 'diyFocus';
                        break;
                    }
                    showImg(currslid, imgDiv, adWidth);
                    stopIt(imgType);
                    $("#" + imgDiv + "Span > span").removeClass('current');
                    var rel = 0;
                    $("#" + imgDiv + "Span > span").each(function () {
                        rel = parseInt($(this).attr('rel'));
                        if (rel == currslid) {
                            $(this).addClass('current');
                        }
                    });
                });
    $("#feeMobile").bind("keyup", function () {
        var mobile = $(this).val();
        var mobileLen = mobile.length;
        if (11 == mobileLen) {
            var checkMobile = checkMobileNumber(mobile);
            if (checkMobile) {
                $('#feeError').html('').hide();
            }
        }
    });
    $("#feeMobile").bind("blur", function () {
        var mobile = $(this).val();
        var mobileLen = mobile.length;
        if (11 == mobileLen) {
            var checkMobile = checkMobileNumber(mobile);
            if (checkMobile) {
                $('#feeError').html('').hide();
            } else {
                $('#feeError').html("请输入正确的手机号码");
                $("#feeMobile").focus();
            }
        }
    });
                // 左侧导航特效
                $(".menu-nav-container > li").hover(function () {
                    $(this).addClass("current");
                },
                function () {
                    $(this).removeClass("current");
                });
            });
    var __Window = $(window);
    var __Body = $(document);
    var topNavObj = {};
            //获取屏幕高度
            topNavObj.getClientHeight = function () {
                var clientHeight = __Window.height();
                this.winHeight = parseInt(clientHeight);
                return this.winHeight;
            }
            //获取当前页面已滚动的高度
            topNavObj.getScrollHeight = function () {
                var scrollTop = __Body.scrollTop();
                this.scrollTop = parseInt(scrollTop);
                return this.scrollTop;
            }
            //初始化调用
            topNavObj.init = function () {
                this.getClientHeight();
            }
            //滚动事件监听
            topNavObj.init();
            var topNavDiv = $("#search_layer_fixed");
            __Window.scroll(function () {
                var hasScrollTop = topNavObj.getScrollHeight();
                if (hasScrollTop > topNavObj.winHeight) {
                    topNavDiv.show();
                } else {
                    topNavDiv.fadeOut(300);
                }
            });
            //意见建议调用
            var baseDetailUrl = "http://www.zol.com/index.php?";//Ajax请求基础域名
            var cType = 'Index';//建议反馈
            var aType = 'Index';//建议反馈
            $(function () {
                //调用
                $.survey({channel: '首页'});
            });
            </script>
            <!-- 侧边栏 -->
            <div class="zc-side-toolbar-box" id="side-toolbar-wrapper" data-url="/index.php?c=Ajax_RightSidebar">
                
                <!-- Hover Tips -->
                <div class="zc-tab-tips" id="hover_tips"></div>
                <!-- 右侧切换层 -->
                <div class="zc-toolbar-plugins">
                    <!-- 我的订单 -->
                    <div class="zc-toolbar-plugin">
                        <div class="zc-toolbar-plugin-hd">
                            <div class="zc-toolbar-plugin-title">我的订单</div>
                            <div class="zc-toolbar-plugin-close"></div>
                        </div>
                        <div class="zc-toolbar-plugin-bd">
                            <div class="zc-scroll-bd">
                                <ul class="zc-order-list" data-contains="OrderInfo"></ul>
                            </div>
                            <div class="zc-view-all"><a href="http://my.zol.com/index.php?c=OrderManage"><span>查看全部</span>&gt;&gt;</a></div>
                        </div>
                    </div>
                    <!-- //我的订单 -->
                    <!-- 我的足迹 -->
                    <!-- //我的足迹 -->
                    <!-- 购物车 -->
                    <div class="zc-toolbar-plugin zc-cart-box">
                        <div class="zc-toolbar-plugin-hd">
                            <div class="zc-toolbar-plugin-title">购物车</div>
                            <div class="zc-toolbar-plugin-close"></div>
                            <a href="http://order.zol.com/index.php?c=Cart" class="zc-all-links">全部&gt;&gt;</a>
                        </div>
                        <div class="zc-toolbar-plugin-bd">
                            <div class="zc-scroll-bd">
                                <ul class="zc-cart-list" data-contains="ShopCart"></ul>
                            </div>
                        </div>
                    </div>
                        <script src="./css_js/main/shopLoginLayer.js"></script>
                        <script src="./css_js/main/perfect-scrollbar.jquery.min.js"></script>
                        <script src="./css_js/main/side_toolbar.js"></script>
                        <script src="./css_js/main/side_toolbar_fun_v1.0.js"></script>
                        <script>
    //侧边栏购物车数量 
    function setCartNum(){
        var url = "http://www.zol.com/index.php?c=Ajax_ShopCart&a=GetCartNumber&callback=?&t="+Math.random();
        $.getJSON(
            url,
            {},
            function(data){
                $("#cart-total").html(data.cartNumber);
            }
            );
    }
    setCartNum();
    </script>
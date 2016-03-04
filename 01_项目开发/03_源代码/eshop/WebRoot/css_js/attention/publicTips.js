/*-------------------------------------------------------------------------
 jQuery弹出窗口
 edit by yuhx [2013-03-19]
--------------------------------------------------------------------------
 参数：[可选参数在调用时可写可不写,其他为必写]
----------------------------------------------------------------------------
    title:              弹出层标题
    subtitle:           弹出层子标题
    type:               弹出层类型
    content:            弹出层内容{ text | loading | alert | confirm }
    width:              弹出层宽度
    height:             弹出层高度
    time:               弹出层显示时间
    drag:               是否可以拖动
    showbg:             是否显示背景遮罩层
    buttonleft:         按钮是否居左
    cssClass:           附加样式类名
    callback:           回调函数
    backTrue:           回调函数是否在返回true时关闭弹出层
    templateSrc:        设置loading.gif路径
------------------------------------------------------------------------
 示例: 
------------------------------------------------------------------------
 openTips({title:"例子",content:"例子",type:"text",width:"500",height:"400",time:"3000"})
------------------------------------------------------------------------*/
function openTips(params) {
    // 设置弹出层最大宽高
    var maxWidth = $(document).width()/2;
    var maxHeight = $(document).height()-100;
	
    // 判断是否为IE6或IE7浏览器
    var _version = '';
    if(navigator.userAgent.indexOf("MSIE") > 0){
        if(navigator.userAgent.indexOf("MSIE 6.0")>0){
            _version = 6;
        }else{
            _version = 7;
        }
    }
	
    // 合并参数
    var p = $.extend( {},
    {
        title:"",		// 弹出层标题
        subtitle:"",		// 弹出层子标题
        type:"text",		// 弹出层类型
        content:"",		// 弹出层内容
        width:"250",		// 弹出层宽度
        height:"150",		// 弹出层高度
        time:'',		// 弹出层显示时间
        drag:"true",		// 是否可以拖动
        showbg:"true",		// 是否显示背景遮罩层
        buttonleft:"",		// 按钮是否居左
        cssClass:"",		// 附加样式类名
        callback:"",		// 回调函数
        backTrue:"",		// 回调函数是否在返回true时关闭弹出层
        templateSrc:"http://icon.zol-img.com.cn/zol_mall/detail/new/"   //设置loading.gif路径
    },
    params
    );

    // 定义参数
    var title       = p.title;			// 弹出层标题
    var subtitle    = p.subtitle;		// 弹出层子标题
    var type        = p.type;			// 弹出层类型
    var content     = p.content;		// 弹出层内容
    var width       = p.width  > maxWidth  ? maxWidth  : p.width;    //设置弹出层最大窗口宽度
    var height      = p.height > maxHeight ? maxHeight : p.height;  //设置弹出层最大窗口高度
    var time        = p.time;			// 弹出层显示时间
    var drag        = p.drag;			// 是否可以拖动
    var showbg      = p.showbg;		// 是否显示背景遮罩层
    var buttonleft  = p.buttonleft;		// 按钮是否居左
    var cssClass    = p.cssClass;		// 附加样式类名
    var callback    = p.callback;		// 回调函数
    var backTrue    = p.backTrue;		// 回调函数是否在返回true时关闭弹出层
    var templateSrc = p.templateSrc;         // 设置loading.gif路径

    // 清除已弹出内容
    $(".layerbox-border").remove();
    $(".layerbox-overlay").remove();

    // 初始化弹出层
    var simpleWindown_html = new String;
	    
    // 设置背景遮罩层
    if(showbg === "true") {
        simpleWindown_html += '<div class="layerbox-overlay"></div>';
    }
	
    // 设置弹出层 边框 开标签
    simpleWindown_html += '<div id="layerbox-border" class="layerbox-border">';
	
    // 设置弹出层 内容 开标签
    if(cssClass){
        simpleWindown_html += '<div class="layerbox-content '+cssClass+'">';
    }else{
        simpleWindown_html += '<div class="layerbox-content">';
    }
	
    // 设置弹出层 头部 开标签
    simpleWindown_html += '<div id="layerbox-head" class="layerbox-head">';
	
    // 设置弹出层 标题 开标签
    simpleWindown_html += '<h3 class="layerbox-title">';
	
    // 设置弹出层 标题
    simpleWindown_html += title;

    // 设置弹出层 子标题 开标签
    simpleWindown_html += '<span class="layerbox-subtitle">';

    // 设置弹出层 子标题
    simpleWindown_html += subtitle;

    // 设置弹出层 子标题 闭标签
    simpleWindown_html += '</span>';	

    // 设置弹出层 关闭按钮
    simpleWindown_html += '<i class="layerbox-close"></i>';

    // 设置弹出层 标题 闭标签
    simpleWindown_html += '</h3>';	

    // 设置弹出层 头部 闭标签
    simpleWindown_html += '</div>';

    // 设置弹出层 主体 开标签
    simpleWindown_html += '<div class="layerbox-body">';

    // 设置弹出层 主体 闭标签
    simpleWindown_html += '</div>';

    // 设置弹出层 底部 开标签
    if(buttonleft){
        simpleWindown_html += '<div class="layerbox-foot layerbox-footleft">';
    }else{
        simpleWindown_html += '<div class="layerbox-foot">';
    }

    // 设置弹出层 操作按钮
    simpleWindown_html += '<a href="javascript:void(0)" class="layerbox-button-true">确定</a><a href="javascript:void(0)" class="layerbox-button-false">取消</a>';

    // 设置弹出层 底部 闭标签
    simpleWindown_html += '</div>';
	
    // 设置弹出层 内容 闭标签
    simpleWindown_html += '</div>';

    // 设置弹出层 边框 闭标签
    simpleWindown_html += '</div>';
	
    // 添加弹出层至模板
    $("body").append(simpleWindown_html);
	
    // 如果没有标题，隐藏头部
    if(title === ''){
        $('.layerbox-head').hide();
    }

    // 设置弹出内容
    switch(type) {
        case "loading": // 读取中
            content = "<img src='"+templateSrc+"loading.gif' class='loading' />";
            $('.layerbox-foot').remove();
            break;
        case "alert": // 弹出信息
            $(".layerbox-button-false").remove();
            break;
        case "confirm": // 确认信息
            break;
        case "text": // 文本提示
            $('.layerbox-foot').remove();
            break;
    }
    $(".layerbox-body").html(content);
	
    // 设置弹出层宽高
    $(".layerbox-content").css({
        width:width+"px",
        height:height+"px"
    });

    // 设置弹出层居中
    var cw = parseInt(document.documentElement.clientWidth);	// 网页可见区域宽
    var ch = parseInt(document.documentElement.clientHeight);	// 网页可见区域高
    var st = parseInt(document.documentElement.scrollTop);		// 网页被卷去的高
    var marginTop  = -height / 2  +"px";
    var marginLeft = -width  / 2  +"px";
	
    // 判断是否为ie6
    if ( _version === 6 ) {
        var ieTop = ch/2+st+"px";
        $(".layerbox-border").css({
            left:"50%",
            top: ieTop,
            marginTop: marginTop,
            marginLeft: marginLeft,
            position: 'absolute'
        });
        $(window).scroll(function(){
            $(".layerbox-border").css({
                top:parseInt(document.documentElement.scrollTop+document.documentElement.clientHeight-320)+"px"
            });
        });
    }else {
        $(".layerbox-border").css({
            left:"50%",
            top:"50%",
            marginTop:marginTop,
            marginLeft:marginLeft,
            position: 'fixed'
        });
    }
	
    // 设置拖动效果
    var DragID = document.getElementById("layerbox-border"),DragHead = document.getElementById("layerbox-head");
    var moveX = 0,moveY = 0,moveTop,moveLeft = 0,moveable = false;
    
    if ( _version === 6 ) {
        moveTop = st;
    }else {
        moveTop = 0;
    }
    var	sw = DragID.scrollWidth,sh = DragID.scrollHeight;

    DragHead.onmouseover = function(e) {
        if(drag === "true"){
            DragHead.style.cursor = "move";
        }else{
            DragHead.style.cursor = "default";
        }
    };

    DragHead.onmousedown = function(e) {
        if(drag === "true"){
            moveable = true;
        }else{
            moveable = false;
        }
        e = window.event?window.event:e;
        var ol = DragID.offsetLeft, ot = DragID.offsetTop-moveTop;
        moveX = e.clientX-ol;
        moveY = e.clientY-ot;
        document.onmousemove = function(e) {
            if (moveable) {
                e = window.event?window.event:e;
                var x = e.clientX - moveX;
                var y = e.clientY - moveY;
                if ( x > 0 &&( x + sw < cw) && y > 0 && (y + sh < ch) ) {
                    DragID.style.left = x + "px";
                    DragID.style.top = parseInt(y+moveTop) + "px";
                    DragID.style.margin = "auto";
                }
            }
        };
        document.onmouseup = function () {
            moveable = false;
        };
        DragID.onselectstart = function(e){
            return false;
        };
    };
	
    // 在ie6时隐藏select下拉框
    if ( _version === 7 || _version === 6 ){
        $('select').css("visibility","hidden");
    }
	

    // 显示弹出层
    $(".layerbox-border").show();
	
    // 保持内容竖直居中
    var headHeight = $(".layerbox-head:visible").innerHeight() ? parseInt($(".layerbox-head").innerHeight()) : 0;
    var bodyHeight = $(".layerbox-body:visible").innerHeight() ? parseInt($(".layerbox-body").innerHeight()) : 0;
    var footHeight = $(".layerbox-foot:visible").innerHeight() ? parseInt($(".layerbox-foot").innerHeight()) : 0;
    var middleHeight = (height - headHeight - bodyHeight - footHeight)/2;
    $(".layerbox-body").css('padding-top',middleHeight);
    $(".layerbox-body").css('padding-bottom',middleHeight);
	
    // 关闭弹出层
    var closeTips = function() {
        $(".layerbox-overlay").remove();
        $(".layerbox-border").fadeOut("slow",function(){
            $(this).remove();
        });
        // 显示select下拉框
        $('select').css("visibility","visible");
    };

    // 判断关闭时间关闭弹出层
    if( time === "" || typeof(time) === "undefined") {
        $(".layerbox-button-true").click(function() {
            if(backTrue){
                if(callback){
                    if(eval(callback)){
                        closeTips();
                    }
                }else{
                    closeTips();
                }
            }else{
                closeTips();
                if(callback){
                    eval(callback);
                }
            }
        });
        $(".layerbox-close,.layerbox-button-false").click(function() {
            closeTips();
        });
    }else {
        setTimeout(closeTips,time);
    }
}

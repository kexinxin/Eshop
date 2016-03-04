$(document).ready(
    (function(){
        //删除商品关注
        $("[fn='delFollowGoods']").click(function(){
            var _this  = this;
            var params = {title: '提示',//弹出层标题
                            subtitle:'',//弹出层子标题
                            type:'confirm',//弹出层类型{ text | loading | alert | confirm }
                            content:'确定取消关注这个商品吗？',//弹出层内容
                            drag:true,//是否可以拖动
                            buttonleft:'',//按钮是否居左
                            cssClass:'',//附加样式类名
                            height:'135',
                            width:'300',//弹出层宽度
                            time:''
                                };
            openTips(params);
            $(".layerbox-button-false, .layerbox-close").live('click',function(){return false;});
            $(".layerbox-button-true").live('click',function(){
                var goodsId = $(_this).attr('goodsId');
                if(goodsId){
                    var url = "./index.php?c=Ajax_Follow"
                    var data = {"goodsId":goodsId,"t":(new Date()).valueOf(),"a":'DelFollowGoods'};
                    $.getJSON(url,data,function(backdata){
                        var params = {title: '提示',//弹出层标题
                            subtitle:'',//弹出层子标题
                            type:'alert',//弹出层类型{ text | loading | alert | confirm }
                            content:backdata.sms,//弹出层内容
                            drag:true,//是否可以拖动
                            buttonleft:'',//按钮是否居左
                            cssClass:'',//附加样式类名
                            height:'135',
                            width:'300',//弹出层宽度
                            time:''
                                };
                        $(".layerbox-button-true ,.layerbox-close").die();
                        openTips(params);
                        $(".layerbox-button-true ,.layerbox-close").click(function(){
                            if(backdata.flag){
                                location.reload();
                            }
                        return false;
                        });
                    });
                }
            return false;
            });
        });
    //同类商品推荐及商家商品推荐
    $("[fn='showLikenessByGoods']").toggle(
        //展开
        function(){
            var _this = this;
            var goodsId = $(_this).attr('goodsId');
            var isFirstTime = $(_this).attr('firstTime');
            if(!goodsId){
                return;
            }
            if(isFirstTime){
                $(_this).parent().parent().next('div').find('ul').html('');
                //请求数据
                var url = "index.php?c=Ajax_Follow";
                var data = {'a':'RecommendGoodsDependOnGoods', 't':(new Date()).valueOf(),'goodsId':goodsId};
                $.getJSON(url,data,function(backdata){
                    if(backdata.content){
                        $(_this).attr('firstTime','');
                        $(_this).parent().parent().next('div').find('ul').attr('totalPage',backdata.totalPage);
                        $(_this).parent().parent().next('div').find('ul').attr('nowPage',backdata.page);
                        $(_this).parent().parent().next('div').find('ul').html(backdata.content);
                    }
                });
            }
            $(_this).addClass('hover');
            $(_this).parent().parent().next('div').show();
        },
        //收起
        function(){
            $(this).removeClass('hover');
            $(this).parent().parent().next('div').hide();
        }
    );
    
    //下一页
    $(".photo-next").hover(function(){
        var ulObject = $(this).prev().prev("div").find('ul');
        var nowPage     = $(ulObject).attr('nowPage');
        var totalPage   = $(ulObject).attr('totalPage');
        if(totalPage > nowPage){
            $(this).addClass('photo-next-hover');
        }else{
            $(this).removeClass('photo-next-hover');
        } 
    });
    //翻页
    $(".photo-prev-hover").live('click',function(){
        var _this = this;
        var ulObject = $(_this).parent('div').children('div').find('ul');
        var goodsId = $(ulObject).attr('goodsId');
        var nowPage  = parseInt($(ulObject).attr('nowPage'))-1;
        if(!goodsId){
            return;
        }
        //请求数据
        var url = "index.php?c=Ajax_Follow";
        var data = {'a':'RecommendGoodsDependOnGoods','page':nowPage, 't':(new Date()).valueOf(),'goodsId':goodsId};
        $.getJSON(url,data,function(backdata){
            if(backdata.content){
                $(ulObject).attr('totalPage',backdata.totalPage);
                $(ulObject).attr('nowPage',backdata.page);
                $(ulObject).html(backdata.content);
                if(backdata.totalPage <= backdata.page){
                    $(ulObject).parent().parent().find('.photo-next').removeClass('photo-next-hover');
                }else{
                    $(ulObject).parent().parent().find('.photo-next').addClass('photo-next-hover');
                }
                if(backdata.page <= 1){
                    $(ulObject).parent().parent().find('.photo-prev').removeClass('photo-prev-hover');
                }else{
                    $(ulObject).parent().parent().find('.photo-prev').addClass('photo-prev-hover');
                }
            }
        });
    });

    $(".photo-next-hover").live('click',function(){
        var _this = this;
        var ulObject = $(_this).parent('div').children('div').find('ul');
        var goodsId = $(ulObject).attr('goodsId');
        var nowPage  = parseInt($(ulObject).attr('nowPage'))+1;
        ulObject.parent().parent().find('.photo-next').removeClass('photo-next-hover');
        if(!goodsId){
            return;
        }
        //请求数据
        var url = "index.php?c=Ajax_Follow";
        var data = {'a':'RecommendGoodsDependOnGoods','page':nowPage, 't':(new Date()).valueOf(),'goodsId':goodsId};
        $.getJSON(url,data,function(backdata){
            if(backdata.content){
                $(ulObject).attr('totalPage',backdata.totalPage);
                $(ulObject).attr('nowPage',backdata.page);
                $(ulObject).html(backdata.content);
                if(backdata.totalPage <= backdata.page){
                    $(ulObject).parent().parent().find('.photo-next').removeClass('photo-next-hover');
                }else{
                    $(ulObject).parent().parent().find('.photo-next').addClass('photo-next-hover');
                }
                if(backdata.page <= 1){
                    $(ulObject).parent().parent().find('.photo-prev').removeClass('photo-prev-hover');
                }else{
                    $(ulObject).parent().parent().find('.photo-prev').addClass('photo-prev-hover');
                }
            }
        });
    });

    })($)
);
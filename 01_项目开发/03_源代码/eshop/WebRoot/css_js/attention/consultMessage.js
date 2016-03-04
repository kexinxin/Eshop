/**
 * 商家咨询js
 * 主要有全选 批量删除等
 *
 * @author liu.siduo
 * @todo 2013-01-28 add by liu.siduo
 */

// 全选功能
$("#chkAll").click(function(){
    var  checked =$(this).attr('checked') || false;
    $("#consultMessageForm :checkbox").attr("checked",checked);
});

// 查看回复
$('.checkreply').hover(
    function(){
        $(this).parents('.status').css('z-index','200');
        $(this).parent('p').next("div").show();
    },
    function(){
        $(this).parents('.status').css('z-index','0');
        $(this).parent('p').next("div").hide();
    }
    )

//单选删除
$(".delgm").click(function(){
    // 商品留言ID
    var id = $(this).attr("id");
    openTips({title:"商品咨询",content:"确定要删除此条信息",type:"confirm",callback:'singleDel('+id+')'});
});

//单点删除函数
function singleDel(id){
    var url = "index.php?c=ConsultMessage&a=AjaxMessageDel&t="+Math.random();
        $.getJSON(url,{id:id},function(data){
            if(data.flag){
                openTips({title:"商品咨询",content:"删除成功",type:"text",time:"1000"});
                setTimeout('window.location.reload()',1500);
            }
        });
}

// 批量操作
$(".deleteAll").click(function(){
    var type = $(this).attr('class');
    //console.log($("input:checked").length);
    var len = $("input:checked").length;
    if(len == 0){
        openTips({title:"提示",content:"请选择删除项",type:"text",time:"1000"});
    }else{
        if(type == 'deleteAll'){
            type = "'"+type+"'";
            openTips({title:"商品咨询",content:"确定要删除这些信息",type:"confirm",callback:'batchDel('+type+')'});
        }
    }
});

//批量删除函数
function batchDel(type){
    var url = "index.php?c=ConsultMessage&a=AjaxMessageAction&label="+type+"&t="+Math.random();
    $.getJSON(url,$('#consultMessageForm').serialize(),function(data){
        if(data.flag){
            openTips({title:"商品咨询",content:"删除成功",type:"text",time:"1000"});
            setTimeout('window.location.reload()',1500);
        }
    });
}

$(".select").change(function(){
    var status =$(this).val();
    window.location="index.php?c=ConsultMessage&status="+status;
})
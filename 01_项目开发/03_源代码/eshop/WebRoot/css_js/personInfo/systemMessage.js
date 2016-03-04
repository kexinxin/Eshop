/**
 * 系统通知js
 * 主要有全选 批量删除等
 *
 * @author liu.siduo
 * @todo 2013-01-24 add by liu.siduo
 */

// 全选功能
$("#chkAll").click(function(){
    var  checked =$(this).attr('checked') || false;
    $("#systemMessageForm :checkbox").attr("checked",checked);
});

// 单选删除
$(".delSms").click(function(){
    // 获取系统消息的ID
    var smsId = $(this).attr("id");
    openTips({title:"系统通知",content:"确定要删除此条信息",type:"confirm",callback:'singleDel('+smsId+')'});
});

//单选删除函数
function singleDel(smsId){
    var url   = "index.php?c=SystemMessage&a=AjaxSmsDel&t="+Math.random();
        $.getJSON(url,{smsId:smsId},function(data){
            if(data.flag){
                openTips({title:"系统通知",content:"删除成功",type:"text",time:"1000"});
                setTimeout('window.location.reload()',1500);
            }
        });
}

// 批量操作
$(".delAll, .readAll").click(function(){
    var action = $(this).attr('class');
    var len = $("input:checked").length;
    if(len == 0){
        openTips({title:"提示",content:"请选择要操作的对象",type:"text",time:"1000"});
    }else{
        if(action == "delAll"){
            action = "'"+action+"'";
            openTips({title:"系统通知",content:"确定要删除这些信息",type:"confirm",callback:'batchAction('+action+')'});
        }else if(action == "readAll"){
            var url = "index.php?c=SystemMessage&a=AjaxSmsAction&label="+action+"&t="+Math.random();
            $.getJSON(url,$('#systemMessageForm').serialize(),function(data){
            if(data.flag){
                openTips({title:"系统通知",content:"标记成功",type:"text",time:"1000"});
                setTimeout('window.location.reload()',1000);
            }
        });
        }
    }
});

//批量操作函数
function batchAction(action){
    var url = "index.php?c=SystemMessage&a=AjaxSmsAction&label="+action+"&t="+Math.random();
    $.getJSON(url,$('#systemMessageForm').serialize(),function(data){
        alert(data.msg);
        if(data.flag){
            setTimeout('window.location.reload()',1500);
        }
    });
}

//点击内容就标记
$("li .infor").click(function(){
    var _this = $(this);
    var id = $(this).parent().children().first().children().val();
    var url = "index.php?c=SystemMessage&a=AjaxSingleRead&singleId="+id+"&t"+Math.random();
    $.getJSON(url,function(data){
        if(data.flag){
            _this.parent().removeClass("unread");
        }
    });
});
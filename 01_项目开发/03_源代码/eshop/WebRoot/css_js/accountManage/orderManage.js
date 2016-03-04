/*
 * 我买到的商品
 * orderManage.js
 *
 * LICENSE:
 * @author yhx
 * @version 1.0
 * @copyright  zol shop
 * @todo
 * 2012-10-16 add by yhx
 */
$.SelectShow();
// 商家联系方式
$('.merchantInfo').hover(
        function() {
            $(this).siblings('.contact-infor').show();
            $(this).parent().parent().css("z-index", "21");
        },
        function() {
            $(this).siblings('.contact-infor').hide();
            $(this).parent().parent().css("z-index", "1");
        });
// 商家留言
$('.czbox .message').hover(
        function() {
            $(this).siblings('.message-cont').show();
        },
        function() {
            $(this).siblings('.message-cont').hide();
        });
// 选择订单状态
$('#orderStatus').change(function() {
    var orderStatus = $(this).val();
    $("#searchStatus option[value='" + orderStatus + "']").attr("selected", "true");
    $('#searchForm').submit();
});
// 提醒卖家发货
function buyerRemindSend(id, toType) {
    var url = 'index.php?c=OrderManage&a=AjaxRemindSend&t=' + Math.random();
    $.getJSON(url, {
        orderId: id,
        toType: toType
    }, function(data) {
        openTips({title: '订单操作', content: data.msg, time: 2000});
        if (data.flag) {
            setTimeout("document.location.reload();", 2000);
        }
    });
}
// 订单状态变更提示
function orderDisposeBox(id, toType) {
    openTips({title: '订单操作', content: '您确定执行此操作么？', type: 'confirm', callback: 'orderDispose("' + id + '","' + toType + '")'});
}
// 订单状态变更
function orderDispose(id, toType) {
    openTips({title: '订单操作', type: 'loading'});
    var url = 'index.php?c=OrderManage&a=AjaxOrderDispose&t=' + Math.random();
    $.getJSON(url, {
        orderId: id,
        toType: toType
    }, function(data) {
        openTips({title: '订单操作', content: data.msg, time: 2000});
        if (data.flag) {
            setTimeout("document.location.reload();", 2000);
        }
    });
}
// 订单状态变更提示
function phoneConfirm(id,merchantId,orderStatus,hasExchange) {
    var content     = '';
    if(hasExchange){
        content     = "该订单处理退款/退货中，如果确认收货将会关闭退款/退货申请，是否确认收货？";
    }else{
        content     = "您确定执行此操作么？";
    }
    openTips({title: '订单操作', content: content, type: 'confirm', callback: 'phoneOrderConfirm("' + id + '","' + merchantId + '","'+ orderStatus +'","'+hasExchange+'")'});
}
//手机订单 
function phoneOrderConfirm(id,merchantId,orderStatus,hasExchange){
    var id          = parseInt(id);
    var merchantId  = parseInt(merchantId);
    var orderStatus = parseInt(orderStatus);
    var hasExchange = parseInt(hasExchange);
    var url         = "http://m.zol.com/index.php?c=Shop_Ajax_ConfirmOrder&a=ChangeOrderStatus&callback=?&t="+Math.random();
    $.getJSON(
        url,
        {orderId:id,merchantId:merchantId,orderStatus:orderStatus,hasExchange:hasExchange},
        function(backdata){
            if(backdata.flag){
                openTips({title: '订单操作', content: "订单操作成功！", time: 2000});
                setTimeout("document.location.reload();", 2000);
            }else{
                openTips({title: '订单操作', content: "抱歉，操作失败！", time: 2000});
            }
        }
    );
}
// 订单状态关联选择
$('#searchStatusList li').click(function() {
    var key = $(this).attr('value');
    var value = $(this).html();
    $('#searchStatus').attr('data-id', key).val(value);
    var hidden = $('#searchStatusHidden');
    if (hidden[0]) {
        $('#searchStatusHidden').val(key);
    } else {
        var hiddenHtml = "<input type='hidden' id='searchStatusHidden' name='searchStatusHidden' value='" + key + "'>";
        $('#searchStatus').after(hiddenHtml);
    }
    $('#searchForm').submit();
});

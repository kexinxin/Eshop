/**
 * select 插件
 * selectShowNoId.js
 *
 * LICENSE:
 * @author yhx
 * @version 1.0
 * @copyright  zol shop
 * @todo
 * 2012-10-16 add by yhx
 */
$.SelectShow = function(option) {
    var defaults = {
        'searchClass': 'selectbox', // 搜索范围类名
        'clickHtml': 'input', // 点击标签名
        'showHtml': 'ul', // 显示标签名
        'listHtml': 'li', // 下拉标签名
        'hoverClass': 'hover', // hover效果类名
        'hiddenName': 'Hidden', // 隐藏域后缀
        'hiddenTab': 'data-id'    // 隐藏域数据标记
    };
    var options = $.extend(defaults, option);
    $('.' + options.searchClass).each(function() {
        var searchClass = this;
        var clickHtml = $(searchClass).find(options.clickHtml);

        // 初始化隐藏域
        var hiddenName = $(clickHtml).attr("name") + options.hiddenName;
        var hiddenInfo = $(clickHtml).attr(options.hiddenTab);
        if (hiddenInfo) {
            $(clickHtml).after("<input type='hidden' id='" + hiddenName + "' name='" + hiddenName + "' value='" + hiddenInfo + "'>");
        }
        $(clickHtml).live({
            'click': function(event) {
                event.stopPropagation();
                // 定义点击的显示标签
                var showHtml = $(this).parent().find(options.showHtml);
                // 计算下拉框高度
                var listHeight = $(showHtml).find(options.listHtml).height();
                var listNum = $(showHtml).find(options.listHtml).size();
                var showHeight = listNum * listHeight;
                $(showHtml).height(showHeight);
                // 隐藏其他下拉框
                $('.' + options.searchClass).children(options.showHtml).fadeOut("fast");
                // 显示下拉框
                $(showHtml).show();
                // 隐藏域名称
                var clickHiddenName = $(clickHtml).attr("name") + options.hiddenName;
                $(showHtml).find(options.listHtml).each(function() {
                    $(this).hover(
                            function() {
                                $(this).addClass(options.hoverClass);
                            },
                            function() {
                                $(this).removeClass(options.hoverClass);
                            }
                    );
                    $(this).click(function() {
                        // 删除隐藏域
                        $('#' + hiddenName).remove();
                        $(clickHtml).val($(this).html());
                        var hiddenHtml = "<input type='hidden' id='" + clickHiddenName + "' name='" + clickHiddenName + "' value='" + $(this).attr('value') + "'>";
                        $(searchClass).append(hiddenHtml);
                        $(showHtml).fadeOut("fast");
                    });

                });
            }
        });
    });
    $(document).live('click', function() {
        $('.' + options.searchClass).find(options.showHtml).fadeOut("fast");
    });
//console.log(showHtml);
};

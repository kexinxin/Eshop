/*
 * 买家中心侧边栏公用JS
 * publicLeft.js
 *
 * LICENSE:
 * @author yhx
 * @version 1.0
 * @copyright  zol shop
 * @todo
 * 2013-01-23 add by yhx
 */
// 买家中心侧边栏选中效果
$(function(){
    $('.nav li a,.nav li em').each(function() {
        $(this).bind('click', function() {
            var that = $(this).parent();
            if ($(that).find('em').hasClass("fold")) {                                   //展开收起图标，如果条件成立
                $('.nav li em:not(.fold)').attr('class', 'fold').parent().find('.subnav').hide();
                $(that).find('em').attr('class', 'open');
                $(that).find('.subnav').show();
            } else {
                $(that).find('em').attr('class', 'fold');
                $(that).find('.subnav').hide();
            }
        });
    });  
})
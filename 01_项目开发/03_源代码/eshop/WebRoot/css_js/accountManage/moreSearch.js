/*
 * ¸ü¶àËÑË÷Ïî
 * moreSearch.js
 *
 * LICENSE:
 * @author yhx
 * @version 1.0
 * @copyright  zol shop
 * @todo
 * 2012-10-16 add by yhx
 */
$('.open-more').click(function(){
    if($(this).hasClass('fold-more')){
        $(this).removeClass("fold-more");
        $('.searchbox-more').fadeOut();
    }else{
        $(this).addClass("fold-more");
        $('.searchbox-more').fadeIn();
    }
})
/**
*   选择下拉框
*
*   by 阿亮 2012-11-20
*/
(function($) {
    $.fn.selectDiv = function(options){
        var defaults = {
            //objId:          '.selectbox' //离开某个dom后下拉框消失的
            showDiv:       ''      //要显示的层ID
            ,
            showDivName:   ''      //要显示的选择下来框的ID
            ,
            ajaxCtrl: 		''      //是否需要ajax获得数据，如果需要，GetManuInfo_showManu_manuName_manuId_请选择厂商，则这个为ajax的控制器名称_要显示的层ID_显示默认你的名称的ID_隐藏数据ID的dom_默认显示的名字
            ,
            valId:			''      //要传值的隐藏input的ID
            ,
            ajaxParamId:   ''      //传入ajax的参数
            ,
            selectType:    'li'    //select下拉的dom
            ,
            mouseOverClass:'hover' //鼠标放上去的样式
            ,
            mouseOutClass: ''      //鼠标移去的样式
            ,
            allHidClass:   ''      //所有的下拉框隐藏,这个是class
            ,
            clickObj:      'input' //默认点击的控件
            ,
            isHiddenDiv:   1       //是否隐藏层
            ,
            isActiveHeight:1      //是否动态改变高度
            ,
            defaultValIdValue:''   //默认隐藏input的值
            ,
            ajaxUrl:''//ajax地址
            ,
            'disabledToShow':true
            ,
            'toShowContent':''
            ,
            'toShowDivHtml':''
            
        };
        var options = $.extend(defaults, options);
        
        if(options.showDiv) {
            if(options.isHiddenDiv){
                $(options.allHidClass).hide();
            }
            $('#'+options.showDiv).fadeIn().show();
        } else {
            return false;
        }
        
        if(options.isActiveHeight) {//是否动态改变高度
            var divLength = $('#'+options.showDiv+' '+options.selectType).length

            if(divLength>=12) {
                $('#'+options.showDiv).css('height',300);
            }else{
                $('#'+options.showDiv).css('height',divLength*25);
            }
        }
        //鼠标放到下拉层的样式
        $('#'+options.showDiv+">"+options.selectType).live('mouseover',function(){
            $(this).addClass(options.mouseOverClass);
        });
        //鼠标离开下拉层的样式
        $('#'+options.showDiv+">"+options.selectType).live('mouseout',function(){
            if(options.mouseOverClass) {
                $(this).removeClass(options.mouseOverClass);
            }
            if(options.mouseOutClass) {
                $(this).addClass(options.mouseOutClass);
            }
        });
        //ajax请求
        function _Ajax() {
            if(options.ajaxCtrl) {
                
                var ajaxCtrlArr = new Array();
                var ajaxParamArr = new Array();
                var ajaxparamStr = '';
                
                ajaxCtrlArr = options.ajaxCtrl.split("_");
                ajaxParamArr = options.ajaxParamId.split("_");
                
                //组合参数
                for(i=0;i<ajaxParamArr.length;i++) { 
                    ajaxparamStr+= "&"+ajaxParamArr[i]+"="+escape($('#'+ajaxParamArr[i]).val());
                }
                var url = options.ajaxUrl+"&a="+ajaxCtrlArr[0]+ajaxparamStr;
                $('#'+ajaxCtrlArr[2]).val('loading....');
                $('#'+ajaxCtrlArr[3]).val('');
                $.ajax({
                    url:url,
                    success: function(data) {
                        $('#'+ajaxCtrlArr[2]).val(ajaxCtrlArr[4]);
                        $('#'+ajaxCtrlArr[1]).html(data);
                        $('#'+ajaxCtrlArr[2]).val('请选择');
                        $('#'+ajaxCtrlArr[2]).attr('disabled',false);
                    }
                });
            }
        }
        //有默认值
        if(options.defaultValIdValue) {
            $('#'+options.valId).val(options.defaultValIdValue);
            _Ajax();
        }
        //禁止冒泡
        $(options.clickObj).click(function(event){
            event.stopPropagation();
        });
       
       
//        $('#'+options.showDivName).live('focusout',function(){
//            if($('#'+options.showDiv+' > li.hover').attr('val')){
//                $('#'+options.valId).val($('#'+options.showDiv+' > li.hover').attr('val'));//把选择的放到隐藏
//            }
//            if($('#'+options.showDiv+' > li.hover').html()){
//                $('#'+options.showDivName).val($('#'+options.showDiv+' > li.hover').html());//把选择的放到外面框
//            }
//            _Ajax();
//            $('#'+options.showDiv).hide();
//        });
        
       
        //下拉层点击
        $('#'+options.showDiv+' '+options.selectType).live('click',function(event){
            event.stopPropagation();
            $('#'+options.valId).val($(this).attr('val'));
            $('#'+options.showDivName).val($(this).html());
            if($(this).attr('val') && $(this).attr('val') != 150){
                _Ajax();
            }else{
                var ajaxCtrlArr = options.ajaxCtrl.split("_");
                $('#'+ajaxCtrlArr[3]).val('');
                $('#'+ajaxCtrlArr[2]).val(options.toShowContent);
                $('#'+ajaxCtrlArr[1]).html(options.toShowDivHtml);
                if(options.disabledToShow){
                    $('#'+ajaxCtrlArr[2]).attr('disabled',true);
                }
            }
            if(options.isHiddenDiv){
                $('#'+options.showDiv).hide();
            }
                
        });
        $(document).click(function(){
            if(options.isHiddenDiv){
                $(""+options.allHidClass+"").hide();
            }
        });
        
    };
})(jQuery);

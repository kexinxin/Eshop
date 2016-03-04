$(function($) {
    var mouseOverEvent = function(){
        $(this).addClass('hover').siblings().removeClass('hover');
        $(this).find('.operate').css('display','block');
        var consigneeName =  $(this).find('span').html();//标签和内容
        $(this).find('span').html('<strong>'+ consigneeName +'</strong>');
    }
    var mouseOutEvent = function(){
        $(this).removeClass('hover');
        $(this).find('.operate').css('display','none');
        var consigneeName =  $(this).find('strong').html();//标签和内容
        $(this).find('strong').replaceWith(consigneeName);
    }
    //鼠标移动到地址上
    $('.address-list > li:not(.add-edits,.current)').bind("mouseenter",mouseOverEvent).bind("mouseleave",mouseOutEvent);      
    // 获取市 
    $.extend({
        getCityInfo: function(options) {
            var defaults = {
                provinceId: 0,
                chooseCityId: 0
            };
            var options = $.extend(defaults, options);
            var provinceId = parseInt(defaults.provinceId);
            var chooseCityId = parseInt(defaults.chooseCityId);
            if (!provinceId) {
                var provinceId = $("#deliverProvinceId").val();
            }
            
            if((!provinceId) || (provinceId == 150)){
                $("#deliverCityId").html('<option>市/县</option>').attr('disabled',true);
            }else{
                $("#deliverCityId").removeAttr('disabled');
            }

            if (provinceId) {
                var url = "index.php?c=Ajax_Address&a=cityInfo&callback=?&t=" + Math.random();
                $.getJSON(
                    url,
                    {provinceId: provinceId},
                    function(data) {
                        if (data.flag) {
                            var cityInfo = data.cityInfo;
                            var cityLen = cityInfo.length;
                            var str = '';
                            for (cityId in cityInfo) {
                                if (chooseCityId == cityId) {
                                    str += '<option value="' + cityId + '" selected>' + cityInfo[cityId].name + '</option>';
                                } else {
                                    str += '<option value="' + cityId + '">' + cityInfo[cityId].name + '</option>';
                                }
                            }
                            $("#deliverCityId").html(str);
                        }
                    }
                )
            }
        }
    });  

    //切换收货地址样式
    $.extend({
        changeAddress: function(obj) {
            
            $('.address-list > li:not(.add-edits,.current)').unbind("mouseenter mouseleave");
            $('#infor-editor').addClass('none');                
            var addressId = $(obj).val();

            //切换时的添加当前样式并显示修改和删除
            $('#list_' + addressId).removeClass('hover').addClass('current').siblings().removeClass('current').children('.operate').css('display','');                                                                
            //循环地址列表
            $(".address-list > li:not('.add-edits')").each(function(){

                var isChecked   = $(this).find("input").attr("checked");
                var thisObj     = $(this).find("span");
                var trueName    = thisObj.find("em").html();
                var adrId= $(this).attr('addliid');
                var defVal = parseInt($("#addressId_"+ adrId).attr("isdefault"));
                if(1 == defVal){
                    if(!isChecked){
                        thisObj.html("[默认] <em>"+trueName+"</em>");
                    }else{
                        thisObj.html("<strong>[默认] <em>"+trueName+"</em><strong>");
                    }
                    $('#deliverDefault').attr('checked',true);
                }else{
                    if(!isChecked){
                        thisObj.html("<em>"+trueName+"</em>");
                    }else{
                        thisObj.html("<strong><em>"+trueName+"</em></strong>");
                    }
                    $('#deliverDefault').attr('checked',false);
                }

                if (!$(this).hasClass('add-edits')){
                    var addressBox = $(this).children(".infor-editor").html();                        
                    if ('' != addressBox){
                        $("#infor-editor").html(addressBox);
                        $(this).children(".infor-editor").remove();                                                        
                    }                        
                }

            });
            //编辑后切换地址然后再切换回刚编辑的地址时，所有的input框变为可操作
            $('.address-list').children().find('input').attr('disabled',false);
            $(".add-edits").addClass("none");
            $('.address-list > li:not(.add-edits,.current)').bind("mouseenter",mouseOverEvent).bind("mouseleave",mouseOutEvent); 


            //重新获取配送支付信息
            $.changeShipping({rel:2});


            //添加框与地址切换
            var liAddressNum = parseInt($('.address-list > li').length - 1);
            if(liAddressNum && (liAddressNum < 10)){
                $('.add-edits').addClass('none');
                $('.add-address').removeClass('none');
                $('.address-list').find('input:checked').parent().parent().addClass('current');
                var classNoneLength = $('.address-list > li').not('.none').length;
                if(classNoneLength == 3 && liAddressNum > 3){
                    $('#addressShow').removeClass('none'); 
                }
                
                if(classNoneLength > 3 && liAddressNum > 3){
                    $('#addressHide').removeClass('none');
                }

            } 
          
                var listDiv    = $('#list_' + addressId);
                if($(".address-list > li:not('.add-edits')").children().hasClass('editBox')){
                    listDiv.children(".operate").css('display','none');
                }else{
                    listDiv.children(".operate").css('display','block');
                }
        }
    });
    
    // 点击添加新地址
    $.extend({
        showAddressBox: function() {       

            $(".address-list > li").each(function(){
                if (!$(this).hasClass('add-edits')){
                    var addressBox = $(this).children(".infor-editor").html();                       
                    if ('' != addressBox){
                        $("#infor-editor").html(addressBox).show();
                        $(this).children(".infor-editor").remove();                                                        
                    }                        
                } 
            });
            //添加中的单选选中，地址列表中的单选选中去掉
            $("input[name='addNewAddress']").attr('checked',true);  
            $("input[name='addressId']").attr('checked',false);
            
            $('.add-address').find('input').removeAttr("checked");
            $(".add-edits").removeClass("none");
            $(".address-list > li").removeClass("current");
            $(".more-address, .add-address").addClass("none"); 
            //$('.operate').css('display','none');
            $('#deliverDefault').attr('checked',false);
            $('#deliverBotton').attr('addressId', 0);            
            $("#deliverName").val('');
            $("#deliverProvinceId").val('');
            $("#deliverCityId").empty();
            $("#deliverCityId").html('<option>市/县</option>');
            $("#deliverAddress").val('');
            $("#deliverPhone").val('');
            $("#deliverMobile").val('');
            $("#deliverDefault").val('0');
            $('#deliverDefault').attr('checked',false);
            
            $('.address-list').find('input:checked').attr('disabled',false);

            $('.address-list > li:not(.add-edits,.current)').bind("mouseenter",mouseOverEvent).bind("mouseleave",mouseOutEvent); 
            $('.address-list').find('li > label > input').parent().parent().find('.operate').css('display','none');
            //清除错误提示和错误框提醒
            $("#deliverNameTips").addClass("none")
            $('#deliverName').removeClass('wrong-text');
            $("#deliverAreaTips").addClass("none");
            $("#deliverAddressTips").addClass("none");
            $('#deliverAddress').removeClass('wrong-text');
            $('#deliverMobile, #deliverPhone').removeClass('wrong-text'); 
            $('#deliverMobileTips').addClass('none');
            $("#deliverMobilePhoneTips").removeClass('wrong-tips')
            $("#deliverPhoneTips").addClass('none');
        }
    });


    // 提示
    $.extend({
        addressTips: function(tipsId, tipsError) {
            if ('deliverNameTips' == tipsId || 'deliverAddressTips' == tipsId) {
                $("#" + tipsId).removeClass("none").html(tipsError);
            } else {
                $("#" + tipsId).removeClass("tips").addClass("wrong-tips").html(tipsError);
            }
        }
    });
   
    // 关闭删除收货地址按钮提示框【添加和编辑间的操作】
    $.extend({
        closeDeleteAddressBox: function() {
            //删除弹层
            $("#deleteBox").css('display','none');
            $(".layerbox-overlay").css('display','none');
            
            var liAddressNum = parseInt($('.address-list > li').length - 1);
            
            if(liAddressNum && (liAddressNum < 10)){
                $('.add-edits').addClass('none');
                $('.add-address').removeClass('none');
                var addliId = $(".address-list > li:not('.add-edits')").find('strong').parent().parent().parent().attr('addliid');
                $('#list_'+addliId+'> label > input').attr('checked',true);
                $('#list_'+addliId).addClass('current');
                $('#list_'+addliId).unbind("mouseenter mouseleave");
                var classNoneLength = $('.address-list > li').not('.none').length;
                if(classNoneLength == 3 && liAddressNum > 3){
                    $('#addressShow').removeClass('none'); 
                }
                
                if(classNoneLength > 3 && liAddressNum > 3){
                    $('#addressHide').removeClass('none');
                }

            }
            //点击编辑再点击添加再切换地址的操作【关闭地址与添加地址】
            $('.address-list').find('input:checked').attr('disabled',false);
            $('.address-list').find('input:checked').parent().parent().find('div').css('display','block');

            //清除错误提示和错误框提醒
            $("#deliverNameTips").addClass("none")
            $('#deliverName').removeClass('wrong-text');
            $("#deliverAreaTips").addClass("none");
            $("#deliverAddressTips").addClass("none");
            $('#deliverAddress').removeClass('wrong-text');
            $('#deliverMobile, #deliverPhone').removeClass('wrong-text'); 
            $('#deliverMobileTips').addClass('none');
            $("#deliverMobilePhoneTips").removeClass('wrong-tips')
            $("#deliverPhoneTips").addClass('none');
        }
    });
    
    // 删除收货地址
    $.extend({
        deleteAddress: function(addressId) {
            var addressId = parseInt(addressId);    
            $('.layerbox-overlay').css('display','block');
            $('#deleteBox').css('display','block'); 
            //防止重复绑定
            $('.ack-btn').unbind('click');
            $('.ack-btn').click(function() {
                var url = "index.php?c=Ajax_NewUserAddress&a=DeleteAddress&callback=?&t=" + Math.random();
                $.getJSON(
                        url,
                        {addressId: addressId},
                        function(data) {
                            if (data.flag) {
                                $("#list_"+addressId).remove();                            
                                var addressNumber = parseInt(data.addressNumber);                                 
                                if (addressNumber){                
                                    $(".address-list > li:eq(0)").addClass("current").siblings().removeClass('current');
                                    $(".address-list > li:eq(0)").unbind("mouseenter mouseleave");
                                    $(".address-list > li:eq(0)").find("input").get(0).checked = true;
                                    $(".address-list > li:not('.add-edits'):gt(0)").children('.operate').css('display','none');
                                    var firstDefVal = $(".address-list > li:eq(0) > label > input").attr('isdefault');
                                    var aname = $(".address-list > li:eq(0)").find('em').html();
                                    //alert(aname);
                                    if(1 == firstDefVal){
                                        $(".address-list > li:eq(0) > label").find('span').replaceWith('<span><strong>[默认] <em>' + aname + '</em></strong></span>');                 
                                    }else{
                                        $(".address-list > li:eq(0) > label").find('em').replaceWith('<strong><em>' + aname + '</em></strong>');  
                                    }
                                    $('.address-list > li:not(.add-edits,.current)').bind("mouseenter",mouseOverEvent).bind("mouseleave",mouseOutEvent); 
                                    
                                    $(".address-list > li:not('.add-edits')").each(function(){
                                        var isChecked   = $(this).find("input").attr("checked");
                                        var thisObj     = $(this).find("span");
                                        var trueName    = thisObj.find("em").html();
                                        var adrId= $(this).attr('addliid');
                                        var defVal = parseInt($("#addressId_"+ adrId).attr("isdefault"));
                                        if(1 == defVal){
                                            if(!isChecked){
                                                thisObj.html("[默认] <em>"+trueName+"</em>");
                                            }else{
                                                thisObj.html("<strong>[默认] <em>"+trueName+"</em><strong>");
                                            }
                                            $('#deliverDefault').attr('checked',true)
                                        }else{
                                            if(!isChecked){
                                                thisObj.html("<em>"+trueName+"</em>");
                                            }else{
                                                thisObj.html("<strong><em>"+trueName+"</em></strong>");
                                            }
                                            $('#deliverDefault').attr('checked',false)
                                        }
                    
                                        if (!$(this).hasClass('add-edits')){
                                            var addressBox = $(this).children(".infor-editor").html();                        
                                            if ('' != addressBox){
                                                $("#infor-editor").html(addressBox);
                                                $(this).children(".infor-editor").remove();                                                        
                                            }                        
                                        }

                                    });
                                    if($(".address-list > li:not('.add-edits')").children().hasClass('editBox')){
                                        $('.address-list').find('li > label > input:checked').parent().parent().find('.operate').css('display','none');
                                    }else{
                                        $('.address-list').find('li > label > input:checked').parent().parent().find('.operate').css('display','block');
                                    }

                                    if(addressNumber <= 3){
                                        $('#addressShow').addClass('none');
                                        $('#addressHide').addClass('none');
                                        $('.address-list > li:lt(3)').removeClass('none');
                                        $('.add-edits').addClass('none');
                                    }
                                    if(addressNumber < 10){
                                        $('.address-list > li:lt(3)').removeClass('none');
                                        $('.add-address').removeClass('none');
                                        $('.add-edits').addClass('none');
                                    }
                            
                                    if(0 == addressNumber){
                                        $('.closeButton').css('display','none');
                                    }else{
                                        $('.closeButton').css('display','block');                         
                                    }
                                    var remainNum = 10 - addressNumber;
                                    //alert(remainNum);
                                    $('.add-address > label').html('<input name="addAddress" type="radio" value="1" onclick="$.showAddressBox()">添加新地址（最多可添加10个地址,您还可以添加'+ remainNum +'个地址）');
                                }else{ // 如果没有地址信息展开添加地址框
                                    $('#deliverDefault').attr('checked',false);
                                    $('#deliverBotton').attr('addressId',0);
                                    $("input[name='addNewAddress']").attr('checked',true);
                                    $('.closeButton').css('display','none');
                                    $(".add-edits").removeClass("none");
                                    $("#deliverName").val('');
                                    $("#deliverProvinceId").val('');
                                    $("#deliverCityId").empty();
                                    $("#deliverCityId").html('<option>市/县</option>');
                                    $("#deliverAddress").val('');
                                    $("#deliverPhone").val('');
                                    $("#deliverMobile").val('');
                                    $("#deliverDefault").val('');
                                    $(".more-address, .add-address").addClass("none");
                                }
                            var addId = $(".address-list > li:eq(0)").find('input').val(); 
                            //重新获取配送支付信息
                            $.changeShipping({rel:2,addressId:addId});
                            }
                        }

                )
                $("#deleteBox").css('display','none');
                $(".layerbox-overlay").css('display','none');
                //return false;
            })
        }

    });

    //修改收货地址
    $.extend({
        updateAddressBox: function(addressId) {
            $('.add-edits').addClass('none');
            $('.add-address').removeClass('none');
            var addressId  = parseInt(addressId); 
            var liAddressNum = parseInt($('.address-list > li').length - 1);
            if(liAddressNum && (liAddressNum >= 10)){
                $('.add-address').addClass('none');
            } 
            var listDiv    = $('#list_' + addressId);
            $(".address-list > li:not(:last)").each(function(){
                if (!$(this).hasClass('add-edits')){
                    //$(this).removeClass("edit");
                    var addressBox = $(this).children(".infor-editor").html();                        
                    if ('' != addressBox){
                        $("#infor-editor").html(addressBox);
                        $(this).children(".infor-editor").remove();       
                        //return false;
                    }                        
                }
                var isChecked   = $(this).find("input").attr("checked");
                var thisObj     = $(this).find("span");
                var trueName    = thisObj.find("em").html();
                var adrId       = $(this).attr('addliid');
                var defVal      = parseInt($("#addressId_"+ adrId).attr("isdefault"));
                if(1 == defVal){
                    if(!isChecked){
                        thisObj.html("[默认] <em>"+trueName+"</em>");
                    }else{
                        thisObj.html("<strong>[默认] <em>"+trueName+"</em><strong>");
                    }
                    $('#deliverDefault').attr('checked',true)
                }else{
                    if(!isChecked){
                        thisObj.html("<em>"+trueName+"</em>");
                    }else{
                        thisObj.html("<strong><em>"+trueName+"</em></strong>");
                    }
                    $('#deliverDefault').attr('checked',false)
                }
            }); 
            var addressBox = $("#infor-editor").html();
            addressBox = '<div class="infor-editor editBox ">' + addressBox + '<div>';
            listDiv.append(addressBox);
            $("#infor-editor").empty();
            $(".address-list > li:not(:last)").each(function(){           
                if($(".address-list > li:not('.add-edits')").children().hasClass('editBox')){
                    listDiv.children(".operate").css('display','none');
                }else{
                    listDiv.children(".operate").css('display','block');
                }
            });
            $('.address-list >li:not(.add-edits)').find('.operate').hide();
            listDiv.unbind("mouseenter mouseleave");
            listDiv.removeClass('hover').addClass('current').siblings().removeClass('current');
            $('#list_' + addressId +' > label >input').attr('checked',true);
            
            $('.address-list > li:not(.add-edits,.current)').bind("mouseenter",mouseOverEvent).bind("mouseleave",mouseOutEvent); 
            $(".address-list > li:not(:last)").each(function(){
                var isChecked   = $(this).find("input").attr("checked");
                var thisObj     = $(this).find("span");
                var trueName    = thisObj.find("em").html();
                var adrId       = $(this).attr('addliid');
                var defVal      = parseInt($("#addressId_"+ adrId).attr("isdefault"));
                if(1 == defVal){
                    if(!isChecked){
                        thisObj.html("[默认] <em>"+trueName+"</em>");
                    }else{
                        thisObj.html("<strong>[默认] <em>"+trueName+"</em><strong>");
                    }
                    $('#deliverDefault').attr('checked',true)
                }else{
                    if(!isChecked){
                        thisObj.html("<em>"+trueName+"</em>");
                    }else{
                        thisObj.html("<strong><em>"+trueName+"</em></strong>");
                    }
                    $('#deliverDefault').attr('checked',false)
                }
            }); 
                
            var addressObj = $("#addressId_"+addressId);
            
            var truename   = addressObj.attr("truename");            
            var provinceId = addressObj.attr("provinceId");
            var cityId     = addressObj.attr("cityId");
            var address    = addressObj.attr("address");
            var mobile     = addressObj.attr("mobile");
            var tel        = addressObj.attr("tel");
            var isDefault  = addressObj.attr("isDefault"); 
            $("#deliverName").val(truename);
            $("#deliverProvinceId").val(provinceId);
            $("#deliverAddress").val(address);
            $("#deliverPhone").val(tel);
            $("#deliverMobile").val(mobile);
            $.getCityInfo({chooseCityId: cityId});
            if (1 == isDefault) {
                $("#deliverDefault").get(0).checked = true;
            }
            //alert(isDefault);
            $("#deliverBotton").attr("addressId", addressId);
            //清除错误提示和错误框提醒
            $("#deliverNameTips").addClass("none")
            $('#deliverName').removeClass('wrong-text');
            $("#deliverAreaTips").addClass("none");
            $("#deliverAddressTips").addClass("none");
            $('#deliverAddress').removeClass('wrong-text');
            $('#deliverMobile, #deliverPhone').removeClass('wrong-text'); 
            $('#deliverMobileTips').addClass('none');
            $("#deliverMobilePhoneTips").removeClass('wrong-tips')
            $("#deliverPhoneTips").addClass('none');

        }
    });
    
    // 保存地址
    $.extend({
        saveAddress: function() {
            var addressId         = $("#deliverBotton").attr("addressId");
            var deliverName       = $("#deliverName").val();
            var deliverProvinceId = $("#deliverProvinceId").val();
            var deliverCityId     = $("#deliverCityId").val();
            var deliverAddress    = $("#deliverAddress").val();
            var deliverPhone      = $("#deliverPhone").val();
            var deliverMobile     = $("#deliverMobile").val();
            var isDefault         = 0;
            if ($("#deliverDefault").is(":checked")) {
                isDefault         = 1;
            }
            
            deliverProvinceId = parseInt(deliverProvinceId);
            deliverCityId     = parseInt(deliverCityId);
            
            //验证
            var flag = true;
            if ('' == deliverName) {
                $("#deliverNameTips").removeClass("none").html('请填写收货人姓名');
                $('#deliverName').addClass('wrong-text');
                flag = false;
            }else if(deliverName.length < 2 || deliverName.match(/~|\!|！|\\|@|#|￥|\$|%|…|\^|<|>|\?|\(|\)|？/)){
                $("#deliverNameTips").removeClass("none").html('请填写有效的收货人姓名');
                $('#deliverName').addClass('wrong-text');
                flag = false;               
            }else{
                $("#deliverNameTips").addClass("none")
                $('#deliverName').removeClass('wrong-text');
            }            

            if (!deliverProvinceId || !deliverCityId) {
                $("#deliverAreaTips").removeClass("none").addClass("wrong-tips").html('请选择地区');
                flag = false;
            }else{
                $("#deliverAreaTips").addClass("none");
            }
            
            if('' == deliverAddress){
                $("#deliverAddressTips").removeClass("none").html("请填写详细地址");
                $('#deliverAddress').addClass('wrong-text');
                flag = false;             
            }else{
                deliverAddress = $.trim(deliverAddress);
                if (deliverAddress.length < 5 || deliverAddress.length > 30 || deliverAddress.match(/~|\!|！|\\|@|#|￥|\$|%|…|\^|<|>|\?|\(|\)|？/)) {
                    $("#deliverAddressTips").removeClass("none").html("请填写有效的详细地址，5~30字");
                    $('#deliverAddress').addClass('wrong-text');
                    flag = false;
                }else{
                    $("#deliverAddressTips").addClass("none");
                    $('#deliverAddress').removeClass('wrong-text');
                }              
            }


            if ('' == deliverPhone && '' == deliverMobile) {
                $("#deliverMobilePhoneTips").addClass("wrong-tips").html("手机号码和固定电话请至少输入一个");
                $('#deliverMobile, #deliverPhone').addClass('wrong-text');                
                flag = false;
            } else {
                if(deliverPhone && ((!deliverPhone.match(/^[0-9|-]+$/)) || (deliverPhone.length < 7)) && deliverMobile && ((!deliverPhone.match(/^[0-9|-]+$/)) || deliverMobile.length != 11)){
                    $("#deliverMobilePhoneTips").addClass("wrong-tips").html("请输入有效的手机号码或固定电话"); 
                    $('#deliverMobile, #deliverPhone').addClass('wrong-text');
                    flag = false;
                //}
                }else{
//                    $("#deliverMobilePhoneTips").removeClass('wrong-tips').html("手机号码和固定电话请至少输入一个"); 
                    $('#deliverMobile, #deliverPhone').removeClass('wrong-text'); 
                    if (deliverMobile && !deliverPhone) { //如果手机存在，固话不存在
                        if((!deliverMobile.match(/^(13|14|15|17|18)\d{9}$/))|| deliverMobile.length != 11){
                            $("#deliverMobilePhoneTips").addClass("wrong-tips").html("请输入有效的11位手机号码");
                            $("#deliverMobile").addClass("wrong-text");
                            flag = false;  
                        }else{
                            $("#deliverMobilePhoneTips").removeClass("wrong-tips").html("手机号码和固定电话请至少输入一个");
                            $("#deliverMobile").removeClass("wrong-text");  
                        }
                    }else{ //固话存在，手机不存在
                        if ((!deliverPhone.match(/^[0-9|-]+$/)) || (deliverPhone.length < 7)) {
                            $("#deliverMobilePhoneTips").addClass("wrong-tips").html("请输入有效的固话号码");
                            $("#deliverPhone").addClass("wrong-text");
                            flag = false;
                        }else{
                            $('#deliverMobilePhoneTips').removeClass('wrong-tips').html("手机号码和固定电话请至少输入一个"); ;
                            $("#deliverPhone").removeClass('wrong-text');                    
                        }

                    }                    
                }
            
            }
          
            if (flag) {
                var url = "index.php?c=Ajax_NewUserAddress&a=SaveAddress&callback=?&t=" + Math.random();
                $.getJSON(
                        url,
                        {deliverName: deliverName, deliverProvinceId: deliverProvinceId, deliverCityId: deliverCityId, deliverAddress: deliverAddress,
                            deliverPhone: deliverPhone, deliverMobile: deliverMobile, addressId: addressId, isDefault: isDefault},
                function(data) {
                    if (1 == data.flag) {
                        //alert(data);
                        var results       = data.results;
                        var addressNumber = parseInt(data.addressNumber);
                        var str = "";
                        
                        str += '<label>';
                        str += '<input  type="radio" tel="' + results.tel + '"  mobile="' + results.mobile + '" address="' + results.address + '" cityId="' + results.cityId + '" provinceId="' + results.provinceId + '" truename="' + results.truename + '" id="addressId_' + results.addressId + '" isDefault="' + results.isDefault + '" checked="true" value="' + results.addressId + '" name="addressId" onclick="$.changeAddress(this)">';
                        str += '<span><strong><em>' + results.truename + '</em></strong></span> ';
                        str += results.provinceName +' '+ results.cityName + ' '+ results.address + ' '+ results.mobile;
                        str += '</label>';
                        str += '<div class="operate"><a onclick="$.updateAddressBox(' + results.addressId + ')" href="javascript:void(0)">编辑</a>';
                        str += '<a onclick="$.deleteAddress(' + results.addressId + ')" href="javascript:void(0)">删除</a></div>';
                        
                        if (data.isAdd) {
                            //保存后除新地址外的其他地址收货人姓名均为正常显示
                            $(".address-list > li:not('.add-edits')").each(function(){
                                var isNotChecked = $(this).find("input").attr("checked",false);  
                                var thisObj      = $(this).find("span");
                                var trueName     = thisObj.find("em").html();
                                var adrId        = $(this).attr('addliid');
                                var defVal       = parseInt($("#addressId_"+ adrId).attr("isdefault"));
                                //alert(adrId);
                                if(1 == defVal){
                                    if(isNotChecked){
                                        thisObj.html("[默认] <em>"+trueName+"</em>");
                                    }else{
                                        thisObj.html("<strong>[默认] <em>"+trueName+"</em><strong>");
                                    }
                                }else{
                                    if(isNotChecked){
                                        thisObj.html("<em>"+trueName+"</em>");
                                    }else{
                                        thisObj.html("<strong><em>"+trueName+"</em></strong>");
                                    }
                                }                                

                            });
                            //添加成功后，放到地址列表的最上面
                            $(".address-list > li").removeClass("current");                          
                            var liStr = '<li class="current" id="list_' + results.addressId + '" addliid='+ results.addressId +'>' + str + '</li>';  
                            $(".address-list > li:first").before(liStr);
                            $(".add-edits").addClass("none");
                            
                            //地址大于3条时，更多常用地址显示
                            if(addressNumber > 3){
                                $('#addressShow').removeClass('none');
                                $('.address-list > li:gt(2)').addClass('none');
                            } 
                                                    
                            //地址10条时隐藏添加按钮
                            if (10 == addressNumber){
                                $(".add-address").addClass("none");
                            }else{
                                $(".add-address").removeClass("none");
                            }
                            
                            //设置默认值更新成功后，其他值设置为0【0未设置1设置为默认地址】
                            if(data.upFlag){
                                //更新为1的那条加默认字样
                                var emObj = $("#list_"+ results.addressId +"> label > span > strong");
                                var listId = emObj.html();
                                emObj.html("[默认] "+ listId);
                                //其余的显示正常
                                $(".address-list > li:not('.add-edits') > label > input:not(:checked)").each(function(){
                                    var nameObj = $(this).parent().find('em');
                                    $(this).parent().find('span').html(nameObj);
                                });
                                $('.address-list').find('li > label > input:not(:checked)').attr('isdefault',0);
                            }
                            
                            //追加关闭字样，没有地址时，没有关闭字样
                            if(addressNumber == 0){
                                $('.add-edits > label').append('<div class="closeButton" style="display:none"><a href="#" class="closebtn" onclick="$.closeDeleteAddressBox()">关闭</a></div>');
                            }else{
                                $('.add-edits > label').append('<div class="closeButton" style="display:block"><a href="#" class="closebtn" onclick="$.closeDeleteAddressBox()">关闭</a></div>');                     
                            } 
                            //绑定鼠标滑过
                            $('.address-list > li:not(.add-edits,.current)').bind("mouseenter",mouseOverEvent).bind("mouseleave",mouseOutEvent); 


                        } else {
                            var addressBox = $(".address-list > li").children(".infor-editor").html();                            
                            $("#infor-editor").html(addressBox);                            
                            $("#list_"+results.addressId).html(str);
                            //追加关闭字样
                            $('.add-edits > label').append('<div class="closeButton" style="display:block"><a href="#" class="closebtn" onclick="$.closeDeleteAddressBox()">关闭</a></div>');
                            
                            if(data.upFlag){
                                var upDefaultStr = $('#list_' + results.addressId).html(str);
                                var firstId = $(".address-list > li:eq(0)").find('input').val(); 
                                if(addressId != firstId){
                                    $(".address-list > li:first").before(upDefaultStr);                                
                                }   
                                var emObj = $("#list_"+ results.addressId +"> label > span > strong");
                                var listId = emObj.html();
                                emObj.html("[默认] "+ listId);
                                $(".address-list > li:not('.add-edits') > label > input:not(:checked)").each(function(){
                                    var nameObj = $(this).parent().find('em');
                                    $(this).parent().find('span').html(nameObj);
                                });

                                
                                $('.address-list').find('li > label > input:not(:checked)').attr('isdefault',0);

                            }
                            //修改后，修改的变为当前地址，同时解除对当前地址的绑定,除当前地址外的其他地址编辑删除均隐藏
                            $('#list_'+addressId).removeClass('hover').addClass('current').siblings().removeClass('current');
                            $('#list_'+addressId).unbind("mouseenter mouseleave");
                            var liAddress = $('.address-list > li:not(.add-edits,.current)');
                            liAddress.children('.operate').css('display','none');
                            liAddress.bind("mouseenter",mouseOverEvent).bind("mouseleave",mouseOutEvent); 
                            $(".address-list > li:not('.add-edits')").each(function(){
                                  var isChecked   = $(this).find("input").attr("checked");
                                  var thisObj     = $(this).find("span");
                                  var trueName    = thisObj.find("em").html();
                                  //alert(addressId);
                                  var adrId= $(this).attr('addliid');
                                  var defVal = parseInt($("#addressId_"+ adrId).attr("isdefault"));
                                  //alert(adrId);
                                  if(1 == defVal){
                                      if(!isChecked){
                                          thisObj.html("[默认] <em>"+trueName+"</em>");
                                      }else{
                                          thisObj.html("<strong>[默认] <em>"+trueName+"</em><strong>");
                                      }
                                  }else{
                                      if(!isChecked){
                                          thisObj.html("<em>"+trueName+"</em>");
                                      }else{
                                          thisObj.html("<strong><em>"+trueName+"</em></strong>");
                                      }
                                  }
                            });
                        }       
                        //要显示的剩余地址信息替换当前的，保存后剩余条数更新
                        var remainNum = 10 - addressNumber;
                        //alert(remainNum);
                        $('.add-address > label').html('<input name="addAddress" type="radio" value="1" onclick="$.showAddressBox()">添加新地址（最多可添加10个地址,您还可以添加'+ remainNum +'个地址）');
                        //重新获取配送支付信息
                        $.changeShipping({rel:2,provinceId:results.provinceId,cityId:results.cityId});
                    } else if (2 == data.flag) {
                        for (tipsId in data.errors) {
                            $.addressTips(tipsId, data.errors[tipsId]);
                        }
                    } else {
                        alert(data.msg);
                    }
                }
                )

            }
        }
    });
    
});

$(document).ready(function() {
    //省份下拉
    $("#provinceName").click(function() {
        var options = {
            showDiv: 'provinceList'      //要显示的层ID
                    ,
            showDivName: 'provinceName'      //要显示的选择下来框的ID
                    ,
            ajaxCtrl: 'GetCityByProvince_cityList_cityName_cityId'      //是否需要ajax获得数据，如果需要，GetManuInfo_showManu_manuName_manuId_请选择厂商，则这个为ajax的控制器名称_要显示的层ID_显示默认你的名称的ID_隐藏数据ID的dom_默认显示的名字
                    ,
            valId: 'provinceId'      //要传值的隐藏input的ID
                    ,
            ajaxParamId: 'provinceId'      //传入ajax的参数
                    ,
            selectType: 'li'    //select下拉的dom
                    ,
            allHidClass:   '.forDivHidden'      //所有的下拉框隐藏,这个是class
            ,
            ajaxUrl:'index.php?c=Ajax_Public'
            ,
            'disabledToShow':true
            ,
            'toShowContent':'请选择城市'
            ,
            'toShowDivHtml':'<li>请选择城市</li>'
        };
        $(this).selectDiv(options);
    });

    //市下拉
    $("#cityName").click(function() {
        var options = {
            showDiv: 'cityList'      //要显示的层ID
                    ,
            showDivName: 'cityName'      //要显示的选择下来框的ID
                    ,
            valId: 'cityId'      //要传值的隐藏input的ID
                    ,
            allHidClass:   '.forDivHidden'      //所有的下拉框隐藏,这个是class
            ,
            selectType: 'li'    //select下拉的dom

        };
        $(this).selectDiv(options);
    });
    //提交信息
    (function() {
        $("#saveAddress").click(function() {
            var addressId = $("#addressId").val();
            var name = $("#name").val();//姓名
            var provinceId = $("#provinceId").val();
            var cityId = $("#cityId").val();
            var address = $("#address").val();
            var zipcode = $("#zipcode").val();
            var telphone1 = $("#telphone1").val();
            var telphone2 = $("#telphone2").val();
            var telphone = telphone1;
            if (telphone) {
                telphone = telphone1 + '-' + telphone2;
            } else {
                telphone = telphone2;
            }
            var mobile = $("#phone").val();
            var email = $("#email").val();
            var isDefault = $("#setDefault").attr('checked') ? 1 : 0;
            //信息检测
            var flag = true;
            //名字
            if (!name) {
                flag = false;
                $("#name").next('b').hide();
                $("#name").next('b').next('b').css('display', 'inline-block');
            } else {
                $("#name").next('b').css('display', 'inline-block');
                $("#name").next('b').next('b').hide();
            }
            //省市
            provinceId == 150
            if(provinceId){
                if(provinceId == 150){
                    $("#areaError").find('b').eq(0).css('display', 'inline-block');
                    $("#areaError").find('b').eq(1).hide();
                }else{
                    if(!cityId){
                        flag = false;
                        $("#areaError").find('b').eq(0).hide();
                        $("#areaError").find('b').eq(1).css('display', 'inline-block');
                    }else{
                        $("#areaError").find('b').eq(0).css('display', 'inline-block');
                        $("#areaError").find('b').eq(1).hide();
                    }
                }
            }else{
                flag = false;
                $("#areaError").find('b').eq(0).hide();
                $("#areaError").find('b').eq(1).css('display', 'inline-block');
            }
            //地址
            if (!address) {
                flag = false;
                $("#address").next('b').hide();
                $("#address").next('b').next('b').css('display', 'inline-block');
            } else {
                $("#address").next('b').css('display', 'inline-block');
                $("#address").next('b').next('b').hide();
            }
            //邮编
            if (!zipcode) {
                flag = false;
                $("#zipcode").next('b').hide();
                $("#zipcode").next('b').next('b').css('display', 'inline-block');
            } else {
                var reg = /^\d{6}$/;
                if (reg.test(zipcode)) {
                    $("#zipcode").next('b').css('display', 'inline-block');
                    $("#zipcode").next('b').next('b').hide();
                } else {
                    $("#zipcode").next('b').hide();
                    $("#zipcode").next('b').next('b').css('display', 'inline-block');
                }
            }
            //手机

            if (!mobile && !telphone) {
                flag = false;
                $("#phone").next('span').hide();
                $("#phone").next('span').next('b').hide();
                $("#phone").next('span').next('b').next('b').text('固定电话和手机至少填写一个').css('display', 'inline-block');
            }else{
                if(mobile && !checkMobile(mobile)){
                    flag = false;
                    $("#phone").next('span').hide();
                    $("#phone").next('span').next('b').hide();
                    $("#phone").next('span').next('b').next('b').text('电话号码格式不正确').css('display', 'inline-block');
                }else{
                    $("#phone").next('span').next('b').show();
                    $("#phone").next('span').css('display', 'inline-block');
                    $("#phone").next('span').next('b').next('b').hide();
                }
                if(telphone && !checkTelphone(telphone)){
                    flag = false;
                    $("#telphone2").next('span').hide();
                    $("#telphone2").next('span').next('b').hide();
                    $("#telphone2").next('span').next('b').next('b').text('电话号码格式不正确').css('display', 'inline-block');
                }else{
                    $("#telphone2").next('span').css('display', 'inline-block');
                    $("#telphone2").next('span').next('b').css('display', 'inline-block');
                    $("#telphone2").next('span').next('b').next('b').hide();
                }
            }
            //email
            if (email) {
                if (checkEmail(email)) {
                    $("#email").next('b').css('display', 'inline-block');
                    $("#email").next('b').next('b').hide();
                } else {
                    flag = false;
                    $("#email").next('b').hide();
                    $("#email").next('b').next('b').css('display', 'inline-block');
                }
            } else {
                $("#email").next('b').hide();
                $("#email").next('b').next('b').hide();
            }
            if (!flag) {
                return;
            }
            //保存信息
            var url = "index.php?c=Ajax_Setting";
            var data = {
                "addressId": addressId,
                "name": name,
                "provinceId": provinceId,
                "cityId": cityId,
                "address": address,
                "zipcode": zipcode,
                "telphone": telphone,
                "mobile": mobile,
                "email": email,
                "isDefault": isDefault,
                "t": (new Date()).valueOf(),
                "a": 'SaveAddress'
            };
            $.getJSON(url, data, function(backdata) {
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
                $(".layerbox-button-true, .layerbox-close").unbind('click');
                openTips(params);
                $(".layerbox-button-true, .layerbox-close").click(function(){
                    if(backdata.flag){
                        location.reload();
                    }
                });
            });
        });
    })($);

    //设置默认
    $("[fn='setDefaultAddress']").click(function() {
        var _this  = this;
        var addressId = $(_this).parent().attr('addressId');
        var url = './index.php?c=Ajax_Setting';
        if (addressId) {
            var data = {"addressId": addressId, "t": (new Date()).valueOf(), "a": 'SetDefaultAddress'};
            $.getJSON(url,data, function(backdata) {
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
                openTips(params);
                $(".layerbox-button-true, .layerbox-close").unbind('click').live('click',function(){
                    if(backdata.flag){
                        location.reload();
                    }
                });
            });
        }
    });
    //删除信息
    $("[fn='deleteAddress']").click(function() {
        var _this  = this;
        var params = {title: '提示',//弹出层标题
                        subtitle:'',//弹出层子标题
                        type:'confirm',//弹出层类型{ text | loading | alert | confirm }
                        content:'地址信息删除后将无法找回，确定删除吗？',//弹出层内容
                        drag:true,//是否可以拖动
                        buttonleft:'',//按钮是否居左
                        cssClass:'',//附加样式类名
                        height:'135',
                        width:'300',//弹出层宽度
                        time:''
                            };
        $(".layerbox-button-true").unbind('click');
        openTips(params);
        $(".layerbox-button-false, .layerbox-close").live('click',function(){return;});
        $(".layerbox-button-true").live('click',function(){
            var addressId = $(_this).parent().attr('addressId');
            var url = 'index.php?c=Ajax_Setting';
            if (addressId) {
                var data = {"addressId": addressId, "t": (new Date()).valueOf(), "a": 'DelAddress'};
                $.getJSON(url,data, function(backdata) {
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
                    openTips(params);
                    $(".layerbox-button-true, .layerbox-close").unbind('click').click(function(){
                        if(backdata.flag){
                            location.reload();
                        }
                    });
                });
            }
        });
    });

    //修改
    $("[fn='changeAddress']").click(function() {
        var _this  = this;
        var params = {title: '提示',//弹出层标题
                        subtitle:'',//弹出层子标题
                        type:'confirm',//弹出层类型{ text | loading | alert | confirm }
                        content:'修改内容将覆盖你当前填写但未保存的地址信息，确定修改吗？',//弹出层内容
                        drag:true,//是否可以拖动
                        buttonleft:'',//按钮是否居左
                        cssClass:'',//附加样式类名
                        height:'135',
                        width:'300',//弹出层宽度
                        time:''
                            };
        openTips(params);
        $(".layerbox-button-false, .layerbox-close").live('click',function(){return;});
        $(".layerbox-button-true").live('click',function(){
            var addressId = $(_this).parent().attr('addressId');
            var email = $(_this).parent().attr('email');
            var isDefault = $(_this).parent().attr('isDefault');
            var addresssInfoObj = $(_this).parent().parent().find('td');
            var truename = $(addresssInfoObj).eq(0).text();
            var provinceId = $(addresssInfoObj).eq(1).attr('provinceId');
            var cityId = $(addresssInfoObj).eq(1).attr('cityId');
            var address = $(addresssInfoObj).eq(2).text();
            var zipcode = $(addresssInfoObj).eq(3).text();
            var mobile = $(addresssInfoObj).eq(4).find("[fn='mobile']").text();
            var telphone = $(addresssInfoObj).eq(4).find("[fn='tel']").text();
            var telphone1, telphone2;
            if (telphone) {
                var telArr = telphone.split("-");
                telphone1 = telArr[0];
                telphone2 = telArr[1];
                if (typeof telArr[2] !== undefined) {
                    telphone += '-'+telArr[2];
                }
            }
            $("#addressId").val(addressId);
            $("#name").val(truename);
            $("#address").val(address);
            $("#zipcode").val(zipcode);
            $("#address").val(address);
            $("#phone").val(mobile);
            $("#telphone1").val(telphone1);
            $("#telphone2").val(telphone2);
            $("#email").val(email);
            $("#contentBox").show();
            if (isDefault) {
                $("#setDefault").attr('checked', true);
            }
            //省市选择
            $("#provinceId").val(provinceId);
            var provinceName = $("#provinceList").find("[val='"+provinceId+"']").text();
            $("#provinceName").val(provinceName);
            $("#cityId").val(cityId);
            if(provinceId){
                if(provinceId == 150){
                    $("#cityName").attr('disabled',true);
                    $("#cityList").html('<li>请选择城市</li>');
                    $("#cityId").val('');
                    return;
                }
                var data = {'provinceId':provinceId,"t":(new Date()).valueOf()};
                $.get('index.php?c=Ajax_Public&a=GetCityByProvince',data,function(backdata){
                    $("#cityName").attr('disabled',false);
                    $("#cityList").html(backdata);
                    var cityName = $("#cityList").find("[val='"+cityId+"']").text();
                    $("#cityName").val(cityName);
                });
            }
    });
    });
});
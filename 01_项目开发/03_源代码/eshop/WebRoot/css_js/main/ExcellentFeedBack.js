//回到顶部及意见反馈
$(function(){
    $.extend({
        survey:function(options){
            //默认配置
            var defaults = {
                content: "将您的使用建议或者想法告诉我们吧，我们将认真倾听您的感受：）", //输入框默认文字
                width: "298",
                height: "207",
                words: 500,
                survClass: 'feedback',//意见建议样式
                backTopClass: 'backtop',//返回顶部样式
                api: baseDetailUrl+"c=Ajax_DetailReply&a=AddReply&callback=?&t="+Math.random(), //Ajax地址
                channel: '<em>“当前页面”</em>',
                merchantId:0
            }
            var options = $.extend(defaults, options);
            var merchantId = defaults.merchantId;
            var survClass   = defaults.survClass;
            var backTopClass    = defaults.backTopClass;
            
            //获取IE版本
            if ($.browser.msie) {
                var ieVersion = parseInt($.browser.version);
            }

            //创建返回顶部和意见反馈入口
            var __feedCreat = function(){
                var feedHtml = $('#pubFeedBack');
                feedHtml.html('<a class="' + survClass +'" href="javascript:void(0)" id="callSurvey" title="建议反馈">建议反馈</a><a class="'+ backTopClass +'" href="javascript:void(0)" style="display:none" id="backTop" title="返回顶部">返回顶部</a>');
                //$("body").append(feedHtml);
                __ie6Fixed();
            }

            //创建反馈框HTML
            var __surveyCreate = function() {
                var surveyHtml = $("<div></div>");
                surveyHtml.addClass("survey-box");
                surveyHtml.attr("id", "D_SurveyBox");
                if (ieVersion && ieVersion < 10) {
                    surveyHtml.addClass("survey-ie")
                }
                surveyHtml.html('<div class="survey-header"><div class="survey-title">您对' + options.channel + '满意吗？</div><a id="D_SurveyClose" class="survey-close" href="#"></a></div><div class="survey-main"><div class="survey-radio survey-radio-good" idx="1"><i></i>满意</div><div class="survey-radio survey-radio-bad" idx="2"><i></i>不满意</div><textarea id="D_SurveyText" class="survey-text default">' + options.content + '</textarea><div class="survey-count">还可以输入<label id="D_SurveyCountCur" class="survey-count-cur">' + options.words + '</label>字</div><button id="D_SurveySubmit" class="survey-submit">提交</button></div><div id="D_SurveyMask" class="survey-mask"></div><div id="D_SurveyTip" class="survey-tip"></div>');
                $("body").append(surveyHtml);
                __ie6Fixed();
            }

            //反馈框显示
            var __surveyShow = function() {
                var surveyBox = $("#D_SurveyBox");
                if (!surveyBox) return;
                if (!ieVersion || ieVersion >= 10) {
                    surveyBox.removeClass("survey-hide-w3c").addClass("survey-show-w3c")
                }
                surveyBox.css("visibility", "visible")
            }

            //反馈框隐藏
            var __surveyHide = function() {
                var surveyBox = $("#D_SurveyBox");
                if (!surveyBox) return;
                __reset();
                if (!ieVersion || ieVersion >= 10) {
                    surveyBox.removeClass("survey-show-w3c").addClass("survey-hide-w3c");
                    return
                }
                surveyBox.css("visibility", "hidden")
            }

            //重置数据
            var __reset = function() {
                $("#D_SurveyText").val(options.content).addClass("default");
                $(".survey-count-cur").text(options.words);
                $(".survey-radio").removeClass("survey-radio-good-sel survey-radio-bad-sel")
            }

            //绑定事件
            var __initEvent = function() {

                $(window).resize(function(){
                    var winW = $(this).width();
                    if (winW <= 1124){
                        $('#pubFeedBack').hide();
                    } else {
                        $('#pubFeedBack').show();
                    }
                })
                $(window).bind('scroll',function(){
                    //console.log($(this).scrollTop());                    
                    if($(this).scrollTop() > 50) {
                        $("#backTop").fadeIn().css({'display':'block'})
                    } else {
                        $("#backTop").fadeOut().css({'display':''})
                    }
                })

                //返回顶部
                $("#backTop").bind('click',function(e) {
                    e.preventDefault();
                    $('html,body').scrollTop(0);
                })

                //显示反馈框
                $("#callSurvey").bind('click',function(e) {
                    e.preventDefault(); 
                    __surveyShow();
                })

                //关闭反馈框
                var surveyClose = $("#D_SurveyClose");
                surveyClose.bind("click", function(e) {
                    e.preventDefault();
                    __surveyHide()
                });

                //选择满意不满意
                var surveyRadios = $(".survey-radio");
                if (!surveyRadios || !surveyRadios.length) return;
                surveyRadios.each(function() {
                    $(this).bind("click", function() {
                        surveyRadios.removeClass("survey-radio-good-sel survey-radio-bad-sel");
                        if ($(this).attr("idx") == 1) {
                            $(this).addClass("survey-radio-good-sel")
                        } else {
                            $(this).addClass("survey-radio-bad-sel")
                        }
                    })
                });

                //文本框状态
                var surveyText = $("#D_SurveyText"), surveySubmit = $("#D_SurveySubmit");
                surveyText.bind({
                    "focus": function() {
                        if ($(this).val() == options.content) {
                            $(this).val("")
                        }
                        $(this).removeClass("default")
                    },
                    "blur": function() {
                        if ($(this).val() == "" || $(this).val() == options.content) {
                            $(this).val(options.content);
                            $(this).addClass("default")
                        } else {
                            $(this).removeClass("default")
                        }
                    },
                    "keyup": function() {
                        var tempLen = (options.words - $(this).val().length), count = $("#D_SurveyCountCur");
                        count.html(tempLen);
                        if (tempLen < 0) {
                            count.addClass("survey-count-over");
                            surveySubmit.attr("disabled", "disabled").addClass("survey-submit-disabled");
                        } else {
                            count.removeClass("survey-count-over");
                            surveySubmit.removeAttr("disabled").removeClass("survey-submit-disabled");
                        }
                    }
                });

                //提交
                if(!surveySubmit.hasClass("survey-submit-disabled")){
                    surveySubmit.bind("click", function() {
                        __submit.call(this)
                    })
                }
            }

            //验证数据
            var __validate = function() {
                var selRadio = $(".survey-radio-good-sel").length > 0 ? $(".survey-radio-good-sel").attr("idx") : "" 
                || $(".survey-radio-bad-sel").length > 0 ? $(".survey-radio-bad-sel").attr("idx") : "";
                var valIn = $("#D_SurveyText").val();
                //userid = $.cookie('zol_userid');  //获取登录cookie
                if ("" == selRadio) {
                    __tip("warning", "请选择 '满意' 还是 '不满意'！");
                    return null
                }
                if (valIn.length == 0 || valIn == options.content) {
                    __tip("warning", "请输入您对" + options.channel + "的建议！");
                    return null
                }
                /*判断是否登录
                if(!userid) {
                    __tip("warning", "登录后才能反馈哦！");
                    return null
                }
                */
                return {causes : selRadio, content : valIn}
            }

            //Ajax提交
            var __submit = function() {
                if (!(feedContent = __validate())) return;
                $.getJSON(
                    options.api,
                    {pageType:cType+'_'+aType,causes:feedContent.causes,content:feedContent.content,merchantId:merchantId},
                    function(data) {
                        if (data.flag == 1) {
                            __tip("success", "提交成功! 谢谢您的反馈!");
                            setTimeout(function() {
                                    __surveyHide()
                            }, 1000)
                        } else {
                            if (data.flag == 0) {
                                    __tip("warning", "提交失败! 请稍后再试!")
                            } else {
                                if (data.flag == 2) {
                                        __tip("warning", "10分钟内只能提交一次额!")
                                }
                            }
                        }   
                    }
                );
            }

            //操作提示
            var __tip = function(type, tipText) {
                var surveyTip = $("#D_SurveyTip"), surveyMask = $("#D_SurveyMask");
                if (!surveyTip || !surveyMask) return;
                surveyTip.removeClass("warning success").addClass(type).html(tipText);
                surveyMask.css("display", "block");
                surveyTip.css("display", "block");
                setTimeout(function() {
                        surveyMask.css("display", "none");
                        surveyTip.css("display", "none")
                }, 1000)
            }

            //IE6 定位到底部
            var __ie6Fixed = function() {
                if (ieVersion !== 6) return;
                var surveyBox = $("#D_SurveyBox");
                var pubFeedBack = $("#pubFeedBack");
                if (!surveyBox || !pubFeedBack) return;
                $(window).bind("scroll", function() {                    
                    var h = $(window).height(), st = $(window).scrollTop(), _top = h + st - options.height;
                    var _top1 = h + st - pubFeedBack.height() - 15;
                    surveyBox.css("top", _top + "px")
                    pubFeedBack.css("top", _top1 + "px")

                })
            }

            if(screen.width>=1280){
                (function() {
                    __feedCreat();
                    __surveyCreate();
                    __initEvent();
                })();
            }
        }
    });
});
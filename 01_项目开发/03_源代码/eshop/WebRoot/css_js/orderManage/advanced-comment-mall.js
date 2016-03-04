//新版点评JS start
var SWFU;
var Comments = {
	// 默认提示
	defaultValue: {
		emptyTips : '随便说点什么吧...',
		advancedTips : [
			'来一句最能表达你购机后心情的一句话',
			'最满意的地方...',
			'最不满意的地方...',
			'公正客观的再来概述几句，结束本次的点评吧！'
		],
		processing : false
	},
	
	// 获取位置
	getPosition: function(o) {
		return {
			left: o.offset().left,
			top: o.offset().top,
			width: o.outerWidth(),
			height: o.outerHeight()
		}
	},
	
	// 高级点评框弹出
	advancedWindow: function(data){
		$('<div id="advancedWindow"></div>').append(data).appendTo($('body'))
		var curScrollTop = $(window).scrollTop();
		var wh = $(window).height();
		var h = $('#advancedWindow').outerHeight();
		if (wh >= h){
			$('#advancedWindow').css({
				'top': curScrollTop + (wh - h)/2
			})
		} else {
			$('#advancedWindow').css('top',curScrollTop)
		}
	},
	
	//swfUpload实例化
	newSwfUpload: function(){
		$.when(
			$.getScript("http://my.zol.com/js/swfupload/swfupload.js"),
			$.getScript("http://my.zol.com/js/swfupload/swfupload.queue.js"),
			$.getScript("http://my.zol.com/js/swfupload/fileprogress.js"),
			$.getScript("http://my.zol.com/js/swfupload/handlers.js"),
			$.Deferred(function(deferred){
				$(deferred.resolve);
			})
		).done(function(){
			var settings = {
				flash_url : "http://my.zol.com/js/swfupload/swfupload.swf",
				upload_url: "http://my.zol.com/index.php?c=Ajax_OrderShare&a=UploadReviewPic&callback=?&t="+Math.random(),
				file_post_name : 'Filedata',
				post_params: {"name": "value"}, //上传时可提交参数
				file_size_limit : "5 MB",
				file_types : "*.jpg;*.gif;*.png;*.bmp;",
				file_types_description : "Image Files",
				file_upload_limit : 9,
				file_queue_limit : 9,
				custom_settings : {
					progressTarget : "upload-box-picture-list",
					cancelButtonId : "btnCancel"
				},
				debug: false,
				// Button settings
				button_width: "80",
				button_height: "60",
				button_placeholder_id: "spanButtonPlaceHolder",
				button_text: '',
				button_window_mode: 'opaque',
				button_cursor: -2,
				// The event handler functions are defined in handlers.js
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,
				queue_complete_handler : queueComplete	// Queue plugin event
			}
			SWFU = new SWFUpload(settings);
		})
	},
	
	/**
	 * 操作提示，默认接受两个参数：
	 * tips : 提示框内的内容，可以是HTML，可以是纯文字
	 * type : 可传入一个选择器，或者CSS对象，如果传的是选择器，则相对于选择器居中显示，如果传的是css，则按照css显示
	 * callback ： 回调函数，当提示层消失的时候调用的函数，可以不定义
	 */
	creatPostTips: function(tips,type,callback){
		var isString = {}.toString.call(type) == "[object String]"
		var isObject = {}.toString.call(type) == "[object Object]"
		
		var postSuccess = $('<div class="hide" id="postSuccessTips">'
			+ '<div class="post-tips-inner">'+ tips +'</div>'
			+ '</div>');
		postSuccess.appendTo($('body'));
		
		var css = {};
		if (isString){
			var pos = this.getPosition($(type))
			css = {
				'left' : pos.left + (pos.width - postSuccess.outerWidth())/2,
				'top' : pos.top + (pos.height - postSuccess.outerHeight())/2
			}
		}
		if(isObject){
			css = type
		}
		postSuccess.css(css).fadeIn(function(){
			var that = $(this);
			setTimeout(function(){
				that.fadeOut(function(){
					that.remove()
					if(callback !== 'undefined' && $.isFunction(callback)){
						callback()
					}
				});
			},600)
		})
	},
		
	clearDefaultTips: function(selector, defaultValue){
		$(document).on('focus', selector, function(){
			var text = $(this).val();
			if(text == defaultValue){
				$(this).val('').css('color','#333');
			}
		})
		$(document).on('blur', selector, function(){
			var text = $.trim($(this).val());
			if(text == ''){
				$(this).val(defaultValue).css('color','#ccc');
			}
		})
	}
}

$(function(){
	
	// 当加载这个弹层成功后执行以下
	$('.orderShareBox').click(function(){
		if(Comments.defaultValue.processing){return}
		Comments.defaultValue.processing = true
        var orderDetailId = $(this).attr('orderdetailid');
		$.ajax({
			type: 'POST',
            data:{orderDetailId:orderDetailId},
			url: '/index.php?c=Ajax_OrderShare&a=OrderShareBox', 
			success: function(data){
				if(data){
					Comments.defaultValue.processing = false
					Comments.advancedWindow(data)
					Comments.newSwfUpload()
				}
			}
		})
	})
	
	// 提示文案
	var advInputArr = ['input[name="advTitleAdv"]','textarea[name="advYoudianAdv"]','textarea[name="advQuedianAdv"]','textarea[name="advZongjieAdv"]'];
	$.each(advInputArr, function(i){
		Comments.clearDefaultTips(advInputArr[i], Comments.defaultValue.advancedTips[i])
	})
		
	// 图片上传弹层
	$('#picUploadBtn').live('click',function(){
		var left = $(this).position().left + 5;
		var top = $(this).position().top + 35;
		$('.pic-upload-box').css({
			'position': 'absolute',
			'left': left,
			'top': top,
			'visibility': 'visible'
		});
		var stats = SWFU.getStats();
		var picNum = parseInt($(this).attr('data-picnum'));
		stats.successful_uploads = picNum;
		SWFU.setStats(stats);
		$("#uploadStatus").html("共 " + stats.successful_uploads + " 张，还能上传"+ parseInt(SWFU.settings['file_upload_limit'] - stats.successful_uploads) +" 张")
	})
	
	// 高级点评删除图片
	$('.upload-pic-del').live('click',function(){
		$(this).parents('li').remove();
		var stats = SWFU.getStats();
		stats.successful_uploads--;
		SWFU.setStats(stats);
		var status = $("#uploadStatus");
		status.html("共 " + stats.successful_uploads + " 张，还能上传"+ parseInt(SWFU.settings['file_upload_limit'] - stats.successful_uploads) +" 张")
		$('#picUploadBtn').attr('data-picnum',stats.successful_uploads)
		SWFU.setButtonDisabled(false);
		// 如果还能上传多张的时候，设置只能选择多张
		if(SWFU.settings['file_upload_limit'] - stats.successful_uploads != 1) {
			SWFU.setButtonAction(SWFUpload.BUTTON_ACTION.SELECT_FILES);
		}
		$('#swfUploadHandle').css('margin-left','0')
	})
	
	// 高级点评弹层关闭
	$('#advanced-window-close').live('click',function(){
		$('#advancedWindow').remove();
	})
	   
	// 图片上传弹层关闭
	$('#upload-box-close').live('click',function(){
		$('.pic-upload-box').css('visibility','hidden');
	})
	
	// 选星星打分
	$('div[node-type=advancedStar]').live('mouseleave',function(){
		$(this).children().not('[flag=1]').removeClass('active');
		$(this).children('[flag=1]').addClass('active');
	})
	$('div[node-type=advancedStar] > div').live('mouseenter',function(){
		$(this).addClass('active');
		$(this).prevAll().addClass('active');
		$(this).nextAll().removeClass('active');
	})
	$('div[node-type=advancedStar] > div').live('click',function(){
		$(this).attr('flag','1');
		$(this).prevAll().attr('flag','1');
		$(this).nextAll().removeAttr('flag');
		var point = $(this).attr('data-rel');
		$(this).siblings('input').val(point);
		
		var total = 0
		$.each($('div[node-type=advancedStar] > input'), function(){
			total += parseInt($(this).val())
		})
		var average = (total/6).toFixed(1);
		var averageStar = (average/5)*108
		$('#rateAverage').text(average + '')
		$('#averageStar').animate({'width':averageStar},200)
	})

    // 高级点评提交操作
	$('#advReviewBtn').live('click',function(){
        if(Comments.defaultValue.processing){return}
        

		var biaoti  = $('input[name="advTitleAdv"]').val();           //点评标题
		var youdian = $('textarea[name="advYoudianAdv"]').val();     //优点
		var quedian = $('textarea[name="advQuedianAdv"]').val();     //缺点
		var zongjie = $('textarea[name="advZongjieAdv"]').val();     //总结
        if( biaoti == Comments.defaultValue.advancedTips[0] 
			&& youdian == Comments.defaultValue.advancedTips[1] 
			&& quedian == Comments.defaultValue.advancedTips[2] 
			&& zongjie == Comments.defaultValue.advancedTips[3]){
        
			var emptyCallback = function(){
				$('input[name="advTitleAdv"]').focus()
			}
			Comments.creatPostTips(Comments.defaultValue.emptyTips,'#advancedWindow',emptyCallback)
			return
        }


		// 获取六个特性打分
		var rcArr = [];
		$('input[name="rc-input"]').each(function(){
			var rcId = $(this).attr('data-id');   // 特性ID
			var rcValue = $(this).val();          // 特性值
            rcArr.push({rcId:rcId,rcValue:rcValue});
		})

        // 总分
        var stars = $('#rateAverage').text();

		// 获取上传的图片src
		var picSrcArr = new Array();
		$('#upload-box-picture-list img').each(function(){
			var picSrc = $(this).attr('data-src');
			picSrcArr.push(picSrc);
		})
		
		var orderDetailId = $("input[name=shareOrderDetailId]").val();
        
		// 商城晒带的pageType 默认为         
		var reviewUrl     = 'http://my.zol.com/index.php?c=Ajax_OrderShare&a=AddOrderShare&callback=?&t='+Math.random();        
        Comments.defaultValue.processing = true
        $.getJSON(
                reviewUrl,
                {orderDetailId:orderDetailId,zongjie:zongjie,youdian:youdian,quedian:quedian,biaoti:biaoti,rcArr:rcArr,picSrcArr:picSrcArr},
                function(data){
                    if (data.flag){
                        Comments.defaultValue.processing = false      
                        $('#advancedWindow').remove();
                        window.location.reload();
                    }else{
                        alert(data.msg);
                    }
                }
        );
	})
})
// 商城晒单JS end
/**
 * 匹配手工位Url链接
 * @author Yangyb
 * @date 2015-08-03
 */
function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");  
        var r = window.location.search.substr(1).match(reg);  //获取url中"?"符后的字符串并正则匹配
        var context = "";  
        if (r != null)  
                 context = r[2];  
        reg = null;  
        r = null;  
        return context == null || context == "" || context == "undefined" ? "" : context;  
}
var urlSpm = GetQueryString("spm");

var alinkArr = new Array(); 
alinkArr = document.getElementsByTagName('a');
var areaArr = new Array();
areaArr = document.getElementsByTagName('area');
var areaLen = areaArr.length;
var len = alinkArr.length;
if(urlSpm){
    var reg = new RegExp("\\?.*$","m");
    for(var i=0; i<=len-1;i++){
        var thisHref = alinkArr[i].getAttribute("href"); 
        var nowHref = "";
        if(thisHref !== 'javascript:void(0)' && thisHref !='javascript:void(0);' && thisHref != null && thisHref !== 'javascript:' && thisHref !== '#' && thisHref !== '' && thisHref !== 'null' && thisHref !== 'undefined'){
            var subStr = thisHref.substr(0,25);             
            if(subStr == 'http://www.zol.com/detail' && thisHref.indexOf('html')){                    
                if(reg.test(thisHref)){	
                    nowHref = thisHref+"&spm="+urlSpm; 
                } else {
                    nowHref = thisHref+"?spm="+urlSpm; 
                }
                alinkArr[i].setAttribute("href", nowHref);
            }

        }            
    }
    
    for(var j=0; j<=areaLen-1;j++){
        var areaHref = areaArr[j].getAttribute("href"); 
        var nowAreaHref = "";
        if(areaHref !== 'javascript:void(0)' && areaHref !='javascript:void(0);' && areaHref != null && areaHref !== 'javascript:' && areaHref !== '#' && areaHref !== '' && areaHref !== 'null' && areaHref !== 'undefined'){
            var subStr = areaHref.substr(0,25);             
            if(subStr == 'http://www.zol.com/detail' && areaHref.indexOf('html')){                    
                if(reg.test(areaHref)){	
                    nowAreaHref = areaHref+"&spm="+urlSpm;  
                } else {
                    nowAreaHref = areaHref+"?spm="+urlSpm; 
                }
                areaArr[j].setAttribute("href", nowAreaHref);
            }

        }            
    }
}
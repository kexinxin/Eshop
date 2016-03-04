//获取中文字符串的长度
function cnlength(str){
  var char_num=0;
  for(i=0;i<str.length;i++){
    if(IsChinese(str.substring(i,i+1))){
      char_num =  char_num+2;
	}else{
      char_num =  char_num+1;
	}
  }
  return char_num ;

}

/************************
*判断输入是否含有为中文
*************************/
function IsChinese(str){
  if(escape(str).indexOf("%u")==-1){ 
    return false;
  }else{
    return true;
  }
}

function cncut(str,length){
    var results = '';
    var strenlength = str.length;
    var cutLocal  = 0;
    for(var i=0;i<str.length;i++){
        if((length-cutLocal)>=1){
            results   = results+str.substring(i,i+1);
            if(IsChinese(str.substring(i,i+1))){
                cutLocal =  cutLocal+1;
            }else{
                cutLocal =  cutLocal+0.5;
            }
        }else if((length-cutLocal)==0.5){
            if(!IsChinese(str.substring(i,i+1))){
                results   = results+str.substring(i,i+1);
                cutLocal =  cutLocal+0.5;
            }
        }
    }
    return results;
}

//检测邮箱是否合法
function checkEmail(email){
    var flag = false;
    if(typeof(email) != "string"){
        return flag;
    }
    var mailReg=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9\-]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9\-]+(\.[a-zA-Z]{2,})+$/;
    if(mailReg.test(email)){
        flag=true;
    }
    return flag;
}
//检测手机号码是否合法
function checkMobile(mobile){
    var flag = true;
    if(typeof(mobile) != "string"){
        flag = false;
    }else{
        // 检测 联系电话 - 手机号码
        var mobileReg   = /^(13|14|15|17|18)\d{9}$/;
        if(!mobileReg.test(mobile)){
            flag = false;
        }
    }
    return flag;
}

//检测电话号码是否合法
function checkTelphone(telphone){
    var flag = true;
    if(typeof(telphone) != "string" && typeof(telphone) != "number"){
        flag = false;
    }else{
        // 检测 联系电话 - 座机
        var telReg      = /^((\d{3,4}-)?\d{7,8})$/;
        if(!telReg.test(telphone)){
            flag = false;
        }
    }
    return flag;
}

function checkPhone(phone){
    var flag = true;
    if(!checkMobile(phone) && !checkTelphone(phone)){
        flag = false;
    }
    return flag;
}

function checkPrice(price){
    var priceReg= /^\d*(\.\d*)?$/;
    var flag    = true;
    if(price == ""){
        flag = false;
    }else if(priceReg != priceReg){
        flag = false;
    }else if(!priceReg.test(price)){
        flag = false;
    }
    return flag;
}

function checkNumber(number){
    var numberReg = /^\d{1,}$/;
    var flag = true;
    if(!numberReg.test(number)){
        flag = false;
    }
    return flag;
}

function str_replace(search, replace, subject, count) {
	var i = 0,
	j = 0,
	temp = '',
	repl = '',
	sl = 0,
	fl = 0,
	f = [].concat(search),
	r = [].concat(replace),
	s = subject,
	ra = Object.prototype.toString.call(r) === '[object Array]',
	sa = Object.prototype.toString.call(s) === '[object Array]';
	s = [].concat(s);
	if (count) {
		this.window[count] = 0;
	}
	for (i = 0, sl = s.length; i < sl; i++) {
		if (s[i] === '') {
			continue;
		}
		for (j = 0, fl = f.length; j < fl; j++) {
			temp = s[i] + '';
			repl = ra ? (r[j] !== undefined ? r[j] : '') : r[0];
			s[i] = (temp).split(f[j]).join(repl);
			if (count && s[i] !== temp) {
				this.window[count] += (temp.length - s[i].length) / f[j].length;
			}
		}
	}
	return sa ? s: s[0];
}
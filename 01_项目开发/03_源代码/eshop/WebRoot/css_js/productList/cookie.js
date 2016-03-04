/**
 * Js ¹«ÓÃ cookie
 *
 * LICENSE: 
 * @author yh
 * @version 1.0
 * @copyright  zol shop
 * @todo
 * 2010-06-21 add by yh
 */

function readCookie(name){
  var cookieValue = '';
  var search = name + '=';
  if(document.cookie.length > 0)
  { 
    offset = document.cookie.indexOf(search);
    if (offset != -1)
    { 
      offset += search.length;
      end = document.cookie.indexOf(';', offset);
      if (end == -1) end = document.cookie.length;
      cookieValue = unescape(document.cookie.substring(offset, end))
    }
  }
  return cookieValue;
}

function writeCookie(name, value, hours){
  var expire = '';
  if(hours != null){
    expire = new Date((new Date()).getTime() + hours * 3600000);
    expire = '; expires=' + expire.toGMTString();
  } 
  document.cookie = name + '=' + escape(value) + expire  + ";domain=.zol.com;path=/; ";
}

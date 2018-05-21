/* ==========================================================
	* Copyright (c) 2010, www.115.com. All rights reserved.
	* Date:2009-1-8
	* Author: cai@115.com
	* File: common.js
============================================================*/
var Ylmf = {
	Browser:{
		ie:/msie/.test(window.navigator.userAgent.toLowerCase()),
		ie6:/msie 6.0/.test(window.navigator.userAgent.toLowerCase()),
		moz:/gecko/.test(window.navigator.userAgent.toLowerCase()),
		opera:/opera/.test(window.navigator.userAgent.toLowerCase()),
		safari:/safari/.test(window.navigator.userAgent.toLowerCase())
	},
	 JsLoader :function(sUrl,sId,fCallback,code){
			var _script=document.createElement('script');
			if(code){
				_script.setAttribute('charset',code);
			}else{
				_script.setAttribute('charset','utf-8');
			}
			_script.setAttribute('type','text/javascript');
			_script.setAttribute('src',sUrl);
			_script.id = sId;
			document.getElementsByTagName('head')[0].appendChild(_script);
			if(fCallback){
				if(Ylmf.Browser.ie){
					_script.onreadystatechange=function(){
						if(this.readyState=='loaded'||this.readyState=='complete'){
							fCallback();
						}
					};
				}else if(Ylmf.Browser.moz){
					_script.onload=function(){
						fCallback();
					};
				}else{
					fCallback();
				}
			}

	},
	on:function($, B, D) {
		var _ = [],
		B = B.replace(/^on/, "").toLowerCase();
		_.push($);
		for (var C = 3,
		A = arguments.length; C < A; C++) _.push(arguments[C]);
		if ($.attachEvent) {
			$[B + D] = function() {
				D.apply(window.event, _)
			};
			$.attachEvent("on" + B, $[B + D])
		} else {
			$[B + D] = function($) {
				D.apply($, _)
			};
			$.addEventListener(B, $[B + D], false)
		}
	}
}



/*
var changeLanguage = (function(){
	var button = document.getElementById("change_language");
	var langList = document.getElementById("language_list");
	var Timer;
	Ylmf.on(button,"mouseover",function(){
		
		if(Timer){
			window.clearTimeout(Timer);
		}
		langList.style.display = 'block';
	});
	
	Ylmf.on(button,"mouseout",function(){
		Timer = setTimeout(function(){
			langList.style.display = 'none';
		},300)									   
	});
	
	Ylmf.on(langList,"mouseover",function(){
		if(Timer){
			window.clearTimeout(Timer);
		}
		langList.style.display = 'block';
	});
	Ylmf.on(langList,"mouseout",function(){
		Timer = setTimeout(function(){
			langList.style.display = 'none';
		},300)
	});	
})()*/
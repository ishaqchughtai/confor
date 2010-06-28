/**
 * FlashScaler
 * 
 * @author Jonathan Nicol, f6design.com, f6design.com/journal/ 
 * Copyright 2006, Jonathan Nicol
 * Free for both personal and commercial use
 * 
 * Credits:
 * This class makes use of Simon Willison's addLoadEvent function (http://simon.incutio.com/archive/2004/05/26/addLoadEvent)
 * and viewport size capturing javascript by Peter-Paul Koch (http://www.quirksmode.org/viewport/compatibility.html)
 * 
 * @param {String} flashdiv
 * 		The div that contains the flash onject/embed tag. IE: the same div SwfObject writes to.
 * 
 * @param {Number} w
 * 		Minimum width of Flash Movie. If browser window is narrower, scrollbars will be forced.
 * 
 * @param {Number} h
 * 		Minimum height of Flash Movie. If browser window is shorter, scrollbars will be forced.
 *
 */ 
 
function FlashScaler(flashdiv,w,h){
		
	var flashObj = document.getElementById(flashdiv);
	var minW = w;
	var minH = h;	
	addWindowEvent("onload",resize);
	addWindowEvent("onresize",resize);
	
	function addWindowEvent(eventtype,func) {
  	var oldEvent= window[eventtype];
  	if (typeof window[eventtype] != 'function') {
    	window[eventtype] = func;
  	} else {
    	window[eventtype] = function() {
      	if (oldEvent) {
       	 oldEvent();
      	}
      	func();
    	}
  	}	 	
	}
	
	function resize() {			
		if (self.innerHeight) // all except Explorer
		{
			winW = self.innerWidth;
			winH = self.innerHeight;
		}
		else if (document.documentElement && document.documentElement.clientHeight)	// Explorer 6 Strict Mode
		{
			winW = document.documentElement.clientWidth;
			winH = document.documentElement.clientHeight;
		}
		else if (document.body) // other Explorers
		{
			winW = document.body.clientWidth;
			winH = document.body.clientHeight;
		}	
		if(winH<minH) {
			flashObj.style.height = minH+"px";
		} else {
			flashObj.style.height = "100%";
		}
		if(winW<minW) {
			flashObj.style.width = minW+"px";
		} else {
			flashObj.style.width = "100%";
		}	
	}
	
}
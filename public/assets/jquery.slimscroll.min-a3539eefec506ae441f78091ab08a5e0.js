/*! Copyright (c) 2011 Piotr Rochala (http://rocha.la)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 * Version: 1.2.0
 *
 */
!function(t){jQuery.fn.extend({slimScroll:function(e){var i=t.extend({width:"auto",height:"250px",size:"7px",color:"#000",position:"right",distance:"1px",start:"top",opacity:.4,alwaysVisible:!1,disableFadeOut:!1,railVisible:!1,railColor:"#333",railOpacity:.2,railDraggable:!0,railClass:"slimScrollRail",barClass:"slimScrollBar",wrapperClass:"slimScrollDiv",allowPageScroll:!1,wheelStep:20,touchScrollStep:200},e);return this.each(function(){function s(e){if(h){e=e||window.event;var s=0;e.wheelDelta&&(s=-e.wheelDelta/120),e.detail&&(s=e.detail/3),t(e.target||e.srcTarget||e.srcElement).closest("."+i.wrapperClass).is(m.parent())&&a(s,!0),e.preventDefault&&!b&&e.preventDefault(),b||(e.returnValue=!1)}}function a(t,e,s){var a=t,o=m.outerHeight()-C.outerHeight();e&&(a=parseInt(C.css("top"))+t*parseInt(i.wheelStep)/100*C.outerHeight(),a=Math.min(Math.max(a,0),o),a=t>0?Math.ceil(a):Math.floor(a),C.css({top:a+"px"})),f=parseInt(C.css("top"))/(m.outerHeight()-C.outerHeight()),a=f*(m[0].scrollHeight-m.outerHeight()),s&&(a=t,t=a/m[0].scrollHeight*m.outerHeight(),t=Math.min(Math.max(t,0),o),C.css({top:t+"px"})),m.scrollTop(a),m.trigger("slimscrolling",~~a),l(),n()}function o(){window.addEventListener?(this.addEventListener("DOMMouseScroll",s,!1),this.addEventListener("mousewheel",s,!1)):document.attachEvent("onmousewheel",s)}function r(){g=Math.max(m.outerHeight()/m[0].scrollHeight*m.outerHeight(),w),C.css({height:g+"px"});var t=g==m.outerHeight()?"none":"block";C.css({display:t})}function l(){r(),clearTimeout(p),f==~~f?(b=i.allowPageScroll,v!=f&&m.trigger("slimscroll",0==~~f?"top":"bottom")):b=!1,v=f,g>=m.outerHeight()?b=!0:(C.stop(!0,!0).fadeIn("fast"),i.railVisible&&H.stop(!0,!0).fadeIn("fast"))}function n(){i.alwaysVisible||(p=setTimeout(function(){i.disableFadeOut&&h||c||u||(C.fadeOut("slow"),H.fadeOut("slow"))},1e3))}var h,c,u,p,d,g,f,v,w=30,b=!1,m=t(this);if(m.parent().hasClass(i.wrapperClass)){var y=m.scrollTop(),C=m.parent().find("."+i.barClass),H=m.parent().find("."+i.railClass);if(r(),t.isPlainObject(e)){if("height"in e&&"auto"==e.height){m.parent().css("height","auto"),m.css("height","auto");var x=m.parent().parent().height();m.parent().css("height",x),m.css("height",x)}if("scrollTo"in e)y=parseInt(i.scrollTo);else if("scrollBy"in e)y+=parseInt(i.scrollBy);else if("destroy"in e)return C.remove(),H.remove(),m.unwrap(),void 0;a(y,!1,!0)}}else{i.height="auto"==i.height?m.parent().height():i.height,y=t("<div></div>").addClass(i.wrapperClass).css({position:"relative",overflow:"hidden",width:i.width,height:i.height}),m.css({overflow:"hidden",width:i.width,height:i.height});var H=t("<div></div>").addClass(i.railClass).css({width:i.size,height:"100%",position:"absolute",top:0,display:i.alwaysVisible&&i.railVisible?"block":"none","border-radius":i.size,background:i.railColor,opacity:i.railOpacity,zIndex:90}),C=t("<div></div>").addClass(i.barClass).css({background:i.color,width:i.size,position:"absolute",top:0,opacity:i.opacity,display:i.alwaysVisible?"block":"none","border-radius":i.size,BorderRadius:i.size,MozBorderRadius:i.size,WebkitBorderRadius:i.size,zIndex:99}),x="right"==i.position?{right:i.distance}:{left:i.distance};H.css(x),C.css(x),m.wrap(y),m.parent().append(C),m.parent().append(H),i.railDraggable&&t.ui&&"function"==typeof t.ui.draggable&&C.draggable({axis:"y",containment:"parent",start:function(){u=!0},stop:function(){u=!1,n()},drag:function(){a(0,t(this).position().top,!1)}}),H.hover(function(){l()},function(){n()}),C.hover(function(){c=!0},function(){c=!1}),m.hover(function(){h=!0,l(),n()},function(){h=!1,n()}),m.bind("touchstart",function(t){t.originalEvent.touches.length&&(d=t.originalEvent.touches[0].pageY)}),m.bind("touchmove",function(t){t.originalEvent.preventDefault(),t.originalEvent.touches.length&&a((d-t.originalEvent.touches[0].pageY)/i.touchScrollStep,!0)}),"bottom"===i.start?(C.css({top:m.outerHeight()-C.outerHeight()}),a(0,!0)):"top"!==i.start&&(a(t(i.start).position().top,null,!0),i.alwaysVisible||C.hide()),o(),r()}}),this}}),jQuery.fn.extend({slimscroll:jQuery.fn.slimScroll})}(jQuery);
function handle_side_menu(){$("#menu-toggler").on(ace.click_event,function(){return $("#sidebar").toggleClass("display"),$(this).toggleClass("display"),!1});var e=$("#sidebar").hasClass("menu-min");$("#sidebar-collapse").on(ace.click_event,function(){$("#sidebar").toggleClass("menu-min"),$(this).find('[class*="icon-"]:eq(0)').toggleClass("icon-double-angle-right"),e=$("#sidebar").hasClass("menu-min"),e&&$(".open > .submenu").removeClass("open")}),$(".nav-list").on(ace.click_event,function(a){var s=$(a.target).closest("a");if(s&&0!=s.length){if(s.hasClass("dropdown-toggle")){var n=s.next().get(0);if(!$(n).is(":visible")){var i=$(n.parentNode).closest("ul");if(e&&i.hasClass("nav-list"))return;i.find("> .open > .submenu").each(function(){this==n||$(this.parentNode).hasClass("active")||$(this).slideUp(200).parent().removeClass("open")})}return e&&$(n.parentNode.parentNode).hasClass("nav-list")?!1:($(n).slideToggle(200).parent().toggleClass("open"),!1)}if(e&&"tap"==ace.click_event&&s.get(0).parentNode.parentNode==this){var t=s.find(".menu-text").get(0);if(a.target!=t&&!$.contains(t,a.target))return!1}}})}function enable_search_ahead(){$("#nav-search-input").typeahead({source:["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"],updater:function(e){return $("#nav-search-input").focus(),e}})}function general_things(){$('.ace-nav [class*="icon-animated-"]').closest("a").on("click",function(){var e=$(this).find('[class*="icon-animated-"]').eq(0),a=e.attr("class").match(/icon\-animated\-([\d\w]+)/);e.removeClass(a[0]),$(this).off("click")}),$(".nav-list .badge[title],.nav-list .label[title]").tooltip({placement:"right"}),$("#ace-settings-btn").on(ace.click_event,function(){$(this).toggleClass("open"),$("#ace-settings-box").toggleClass("open")}),$("#ace-settings-header").removeAttr("checked").on("click",function(){this.checked||$("#ace-settings-sidebar").get(0).checked&&$("#ace-settings-sidebar").click(),$(".navbar").toggleClass("navbar-fixed-top"),$(document.body).toggleClass("navbar-fixed")}),$("#ace-settings-sidebar").removeAttr("checked").on("click",function(){this.checked?$("#ace-settings-header").get(0).checked||$("#ace-settings-header").click():$("#ace-settings-breadcrumbs").get(0).checked&&$("#ace-settings-breadcrumbs").click(),$("#sidebar").toggleClass("fixed")}),$("#ace-settings-breadcrumbs").removeAttr("checked").on("click",function(){this.checked&&($("#ace-settings-sidebar").get(0).checked||$("#ace-settings-sidebar").click()),$("#breadcrumbs").toggleClass("fixed"),$(document.body).toggleClass("breadcrumbs-fixed")}),$("#ace-settings-rtl").removeAttr("checked").on("click",function(){switch_direction()}),$("#btn-scroll-up").on(ace.click_event,function(){var e=Math.max(100,parseInt($("html").scrollTop()/3));return $("html,body").animate({scrollTop:0},e),!1}),$("#skin-colorpicker").ace_colorpicker().on("change",function(){var e=$(this).find("option:selected").data("class"),a=$(document.body);a.removeClass("skin-1 skin-2 skin-3"),"default"!=e&&a.addClass(e),"skin-1"==e?$(".ace-nav > li.grey").addClass("dark"):$(".ace-nav > li.grey").removeClass("dark"),"skin-2"==e?($(".ace-nav > li").addClass("no-border margin-1"),$(".ace-nav > li:not(:last-child)").addClass("light-pink").find('> a > [class*="icon-"]').addClass("pink").end().eq(0).find(".badge").addClass("badge-warning")):($(".ace-nav > li").removeClass("no-border margin-1"),$(".ace-nav > li:not(:last-child)").removeClass("light-pink").find('> a > [class*="icon-"]').removeClass("pink").end().eq(0).find(".badge").removeClass("badge-warning")),"skin-3"==e?$(".ace-nav > li.grey").addClass("red").find(".badge").addClass("badge-yellow"):$(".ace-nav > li.grey").removeClass("red").find(".badge").removeClass("badge-yellow")})}function widget_boxes(){$(".page-content").delegate(".widget-toolbar > [data-action]","click",function(e){e.preventDefault();var a=$(this),s=a.data("action"),n=a.closest(".widget-box");if(!n.hasClass("ui-sortable-helper"))if("collapse"==s){var i=n.find(".widget-body"),t=a.find("[class*=icon-]").eq(0),l=t.attr("class").match(/icon\-(.*)\-(up|down)/),o="icon-"+l[1]+"-down",r="icon-"+l[1]+"-up",d=i.find(".widget-body-inner");i=0==d.length?i.wrapInner('<div class="widget-body-inner"></div>').find(":first-child").eq(0):d.eq(0);var c=300,g=200;n.hasClass("collapsed")?(t&&t.addClass(r).removeClass(o),n.removeClass("collapsed"),i.slideUp(0,function(){i.slideDown(c)})):(t&&t.addClass(o).removeClass(r),i.slideUp(g,function(){n.addClass("collapsed")}))}else if("close"==s){var h=parseInt(a.data("close-speed"))||300;n.hide(h,function(){n.remove()})}else if("reload"==s){a.blur();var p=!1;"static"==n.css("position")&&(p=!0,n.addClass("position-relative")),n.append('<div class="widget-box-layer"><i class="icon-spinner icon-spin icon-2x white"></i></div>'),setTimeout(function(){n.find(".widget-box-layer").remove(),p&&n.removeClass("position-relative")},parseInt(1e3*Math.random()+1e3))}})}function switch_direction(){function e(e,s){a.find("."+e).removeClass(e).addClass("tmp-rtl-"+e).end().find("."+s).removeClass(s).addClass(e).end().find(".tmp-rtl-"+e).removeClass("tmp-rtl-"+e).addClass(s)}var a=$(document.body);a.toggleClass("rtl").find(".dropdown-menu:not(.datepicker-dropdown,.colorpicker)").toggleClass("pull-right").end().find('.pull-right:not(.dropdown-menu,blockquote,.dropdown-submenu,.profile-skills .pull-right,.control-group .controls > [class*="span"]:first-child)').removeClass("pull-right").addClass("tmp-rtl-pull-right").end().find(".pull-left:not(.dropdown-submenu,.profile-skills .pull-left)").removeClass("pull-left").addClass("pull-right").end().find(".tmp-rtl-pull-right").removeClass("tmp-rtl-pull-right").addClass("pull-left").end().find(".chzn-container").toggleClass("chzn-rtl").end().find('.control-group .controls > [class*="span"]:first-child').toggleClass("pull-right").end(),e("align-left","align-right"),e("arrowed","arrowed-right"),e("arrowed-in","arrowed-in-right");var s=$("#piechart-placeholder");if(s.size()>0){var n=$(document.body).hasClass("rtl")?"nw":"ne";s.data("draw").call(s.get(0),s,s.data("chart"),n)}}jQuery(function(){handle_side_menu(),enable_search_ahead(),general_things(),widget_boxes()});
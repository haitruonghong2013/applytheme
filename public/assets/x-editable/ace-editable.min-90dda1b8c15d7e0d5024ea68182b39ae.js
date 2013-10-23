!function(i){var t=function(i){this.init("image",i,t.defaults),"on_error"in i.image&&(this.on_error=i.image.on_error,delete i.image.on_error),"on_success"in i.image&&(this.on_success=i.image.on_success,delete i.image.on_success),"max_size"in i.image&&(this.max_size=i.image.max_size,delete i.image.max_size),this.initImage(i,t.defaults)};i.fn.editableutils.inherit(t,i.fn.editabletypes.abstractinput),i.extend(t.prototype,{initImage:function(t,e){this.options.image=i.extend({},e.image,t.image),this.name=this.options.image.name||"editable-image-input"},render:function(){var t=this;this.$input=this.$tpl.find("input[type=hidden]:eq(0)"),this.$file=this.$tpl.find("input[type=file]:eq(0)"),this.$file.attr({name:this.name}),this.$input.attr({name:this.name+"-hidden"}),this.options.image.before_change=this.options.image.before_change||function(e){var n=e[0];if("string"==typeof n){if(!/\.(jpe?g|png|gif)$/i.test(n))return t.on_error&&t.on_error(1),!1}else{var s=i.trim(n.type);if(s.length>0&&!/^image\/(jpe?g|png|gif)$/i.test(s)||0==s.length&&!/\.(jpe?g|png|gif)$/i.test(n.name))return t.on_error&&t.on_error(1),!1;if(t.max_size&&n.size>t.max_size)return t.on_error&&t.on_error(2),!1}return t.on_success&&t.on_success(),!0},this.options.image.before_remove=this.options.image.before_remove||function(){return t.$input.val(null),!0},this.$file.ace_file_input(this.options.image).on("change",function(){var i=t.$file.val()||t.$file.data("ace_input_files")?Math.random()+""+(new Date).getTime():null;t.$input.val(i)}).closest(".ace-file-input").css({width:"150px"}).closest(".editable-input").addClass("editable-image")}}),t.defaults=i.extend({},i.fn.editabletypes.abstractinput.defaults,{tpl:'<span><input type="hidden" /></span><span><input type="file" /></span>',inputclass:"",image:{style:"well",btn_choose:"Change Image",btn_change:null,no_icon:"icon-picture",thumbnail:"large"}}),i.fn.editabletypes.image=t}(window.jQuery),function(i){var t=function(e){this.init("wysiwyg",e,t.defaults),this.options.wysiwyg=i.extend({},t.defaults.wysiwyg,e.wysiwyg)};i.fn.editableutils.inherit(t,i.fn.editabletypes.abstractinput),i.extend(t.prototype,{render:function(){this.$editor=this.$input.nextAll(".wysiwyg-editor:eq(0)"),this.$tpl.parent().find(".wysiwyg-editor").show().ace_wysiwyg({toolbar:["bold","italic","strikethrough","underline",null,"foreColor",null,"insertImage"]}).prev().addClass("wysiwyg-style2").closest(".editable-input").addClass("editable-wysiwyg").closest(".editable-container").css({display:"block"}),this.options.wysiwyg&&this.options.wysiwyg.css&&this.$tpl.closest(".editable-wysiwyg").css(this.options.wysiwyg.css)},value2html:function(t,e){return i(e).html(t),!1},html2value:function(i){return i},value2input:function(i){this.$editor.html(i)},input2value:function(){return this.$editor.html()},activate:function(){}}),t.defaults=i.extend({},i.fn.editabletypes.abstractinput.defaults,{tpl:'<input type="hidden" /><div class="wysiwyg-editor"></div>',inputclass:"editable-wysiwyg",wysiwyg:{}}),i.fn.editabletypes.wysiwyg=t}(window.jQuery),function(i){var t=function(i){this.init("spinner",i,t.defaults),this.initSpinner(i,t.defaults)};i.fn.editableutils.inherit(t,i.fn.editabletypes.abstractinput),i.extend(t.prototype,{initSpinner:function(t,e){this.options.spinner=i.extend({},e.spinner,t.spinner)},render:function(){},activate:function(){if(this.$input.is(":visible")){this.$input.focus(),i.fn.editableutils.setCursorPosition(this.$input.get(0),this.$input.val().length);var t=parseInt(this.$input.val()),e=i.extend({value:t},this.options.spinner);this.$input.ace_spinner(e)}},autosubmit:function(){this.$input.keydown(function(t){13===t.which&&i(this).closest("form").submit()})}}),t.defaults=i.extend({},i.fn.editabletypes.abstractinput.defaults,{tpl:'<input type="text" />',inputclass:"",spinner:{min:0,max:100,step:1,icon_up:"icon-plus",icon_down:"icon-minus",btn_up_class:"btn-success",btn_down_class:"btn-danger"}}),i.fn.editabletypes.spinner=t}(window.jQuery),function(i){var t=function(i){this.init("slider",i,t.defaults),this.initSlider(i,t.defaults)};i.fn.editableutils.inherit(t,i.fn.editabletypes.abstractinput),i.extend(t.prototype,{initSlider:function(t,e){this.options.slider=i.extend({},e.slider,t.slider)},render:function(){},activate:function(){if(this.$input.is(":visible")){this.$input.focus(),i.fn.editableutils.setCursorPosition(this.$input.get(0),this.$input.val().length);var t=this,e=parseInt(this.$input.val()),n=this.options.slider.width||200,s=i.extend(this.options.slider,{value:e,slide:function(e,n){var s=parseInt(n.value);t.$input.val(s),null==n.handle.firstChild&&i(n.handle).append("<div class='tooltip top in' style='display:none;top:-42px;left:-4px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>"),i(n.handle.firstChild).show().children().eq(1).text(s)}});this.$input.parent().addClass("editable-slider").css("width",n+"px").slider(s)}},value2html:function(){},autosubmit:function(){this.$input.keydown(function(t){13===t.which&&i(this).closest("form").submit()})}}),t.defaults=i.extend({},i.fn.editabletypes.abstractinput.defaults,{tpl:'<input type="text" /><span class="inline ui-slider-green"><span class="slider-display"></span></span>',inputclass:"",slider:{min:1,max:100,step:1,range:"min"}}),i.fn.editabletypes.slider=t}(window.jQuery);
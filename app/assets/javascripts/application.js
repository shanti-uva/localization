// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require tinymce
//= require interface_utils/jquery-ui-1.8.24.custom.min

jQuery(document).ready(function(){
	// Add authentication to AJAX POSTs made by jQuery 
	jQuery(document).ajaxSend(function(event, request, settings) {
		if (settings.type == 'GET') return;
		if (typeof(AUTH_TOKEN) == "undefined") return;
		settings.data = settings.data || "";
		if(jQuery.browser.msie){
			settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
		}
	});
})

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})
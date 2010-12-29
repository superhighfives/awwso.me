/* Author: 

*/

Awwsome = {
	
	initalize: function()
	{	
		// Make all Awwsome links open in a new window
		$("a[href^='http']").attr("target", "_blank");
		
		// Set up fullscreen background		
		$.fn.fullscreenr({
			width:1280,
			height:768,
			bgID:"#background"
		});
		
		// Fade in fullscreen background
		$("img#background").fadeIn(500);
		
		Awwsome.setupURL();
		
	},
	
	setupURL: function()
	{
		var urlInput = $("input.url");
		var urlValue = "Enter a URL to shorten";
		Awwsome.resetInput(urlInput, urlValue);
		
		// Set up URL events
		$("input.url").focus(function(){
			switch($(this).val()){
				case urlValue:
					Awwsome.clearInput(urlInput);
					break;
			}
			
		});
		
		$("input.url").blur(function(){
			switch($(this).val()){
				case "":
				case urlValue:
					Awwsome.resetInput(urlInput, urlValue);
					break;
			}
		});
		
		$("form").validate({
			wrapper: "div",
			onfocusout: false
		});
		
		jQuery.extend(jQuery.validator.messages, {
		    required: "Just enter a URL",
		    url: "We'll need a valid URL, including the http bit"
		});
	},
	
	resetInput: function(object, value)
	{
		$(object).addClass("example");
		$(object).val(value);
	},
	
	clearInput: function(object)
	{
		$(object).removeClass("example");
		$(object).val("http://");
	}
	
}

$(document).ready(Awwsome.initalize);
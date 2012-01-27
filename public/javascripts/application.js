// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function showprice(event,id) {
	var showprice=jQuery(document.getElementById(id));
	if(showprice.css('display')=='none')showprice.slideDown(300);
	else showprice.slideUp(300);
}

function newsLine() {
	var xnews = $("#xnews");
	xnews.jixedbar({
	    showOnTop: true,
	    transparent: true,
	    opacity: 0.5,
	    slideSpeed: "slow",
	    roundedCorners: false,
	    roundedButtons: false,
	    menuFadeSpeed: "slow",
	    tooltipFadeSpeed: "fast",
	    tooltipFadeOpacity: 0.5
	});
	xnews.css({"margin-left":0,"width":"100%","border-left":"0","border-right":"0","border-bottom":"0"});
	$("#jx-hid-con-id").css("display","none");
	xnews.children("div").first().css("width","99%");
	//$("div.jx-bar").css({"font-size":"12px","padding-top","2px"});
}

$(function() {
	newsLine();
})
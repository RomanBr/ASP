	var iframe;
	
	window.onresize = function () {
		try {
			resize();
		}
		catch (e) { alert(e); }
	}
 
window.onload = function () {
	try {
		resize();
	}
	catch (e) { alert(e); }
}

function resize () {
			var h = document.body.offsetHeight - document.getElementsByTagName("footer")[0].offsetHeight - document.getElementsByTagName("nav")[0].offsetHeight;
			iframe =  document.getElementById("iframe");
			iframe.height = h + "px";
}

window.onhashchange = function () {
	//location.hash.slice(1);
	iframe.contentDocument.location.hash = location.hash;
}

function hideshowBlogMenu () {
	var blogMenu = document.getElementById ("iframe").contentDocument.getElementById ("blogMenu");
	var blogText = document.getElementById ("iframe").contentDocument.getElementById ("blogText");
	
	if (blogMenu.className == "col-lg-2 col-sm-2 col-xs-2 navbar navbar-default navbar-fixed-top") {
		blogMenu.style = "display: hidden;";
		blogMenu.className = "hidden col-lg-0 col-sm-0 col-xs-0 navbar navbar-default navbar-fixed-top";
		blogText.className = "col-lg-12 col-sm-12 col-xs-12";
	}
		
	else {
		blogMenu.style = "display: block;";
		blogMenu.className = "col-lg-2 col-sm-2 col-xs-2 navbar navbar-default navbar-fixed-top";
		blogText.className = "col-lg-10 col-sm-10 col-xs-10";
	}
}

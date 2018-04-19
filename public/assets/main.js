// TODO: fix adding active class to current page

$(document).ready(function() {
	// get current URL path and assign 'active' class
	var pathname = window.location.pathname;
  console.log(pathname);
	$('.nav > div > ul > li > a[href="'+pathname+'"]').parent().addClass('active');
})

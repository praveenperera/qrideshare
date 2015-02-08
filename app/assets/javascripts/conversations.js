$(document).on('ready page:change', function() {

	$('.message-on-mainpage').hover(
	  function () {

	    $(this).find('.icons').fadeIn(400);
	    $(this).find('p.body').animate({ 
	    	'padding-bottom': '1.5em',
	    }, {duration: 400, queue: false });
	  },
	   	  function () {
		    $('.icons').fadeOut(400);
		    $(this).find('p.body').animate({ 
		    	'padding-bottom': '0',
		    }, {duration: 400, queue: false });
		  }
	);


});//document ready

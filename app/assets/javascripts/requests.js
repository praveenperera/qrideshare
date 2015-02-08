$(document).on('ready page:change', function() {
	$('.timepicker').each(function(k, v) {
	  var $input = $(v).find('.make-timepicker');
	  $input.datetimepicker({
	   	   format: 'hh:mm A',
	       pickDate: false,
	       pickSeconds: false, 
	       pick12HourFormat: true,
	  });
	  $(v).find('span.input-group-addon').click(function(e) {
	    $input.focus(); 
	  });
	});

    $('.datepicker').each(function(k, v) {
      var $input = $(v).find('.make-datepicker');
      $input.datetimepicker({
        format: 'MMM Do YYYY',
        collapse: true,
        pickTime: false,
      });
      $(v).find('span.input-group-addon').click(function(e) {
        $input.focus(); 
      });
    });

});


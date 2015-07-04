

$(function () {
	$('#users_select').multiselect();
	$('#datetimepicker_start').datetimepicker({
		  format:'d-m-Y / H:i',
		  minDate: '0',
  });
	$('#datetimepicker_end').datetimepicker({
		  format:'d-m-Y / H:i',
		  minDate: '0',
	}); 
});


  

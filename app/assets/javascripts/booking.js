$(function () {
	$('#users_select').multiselect({
        includeSelectAllOption: true,
        enableFiltering:true,
        nonSelectedText :'Select Attendees'
    });

	$('#datetimepicker_start').datetimepicker({
		  format:'d-m-Y / H:i',
		  minDate: '0'
  });
	$('#datetimepicker_end').datetimepicker({
		  format:'d-m-Y / H:i',
		  minDate: '0'

	});

});


setTimeout(function() {
  $('.fade_alerts').hide('slow');
}, 5000);

$(document).ready( function () {
    $('#upcoming_table').DataTable(
    	{
    		"bSort" : false
    	});
    $('#todays_table').DataTable(
    	{
    		"bSort" : false
    	});
    $('#complete_table').DataTable(
    	{
    		"bSort" : false
    	});
} );

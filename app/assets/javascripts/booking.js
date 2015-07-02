$(function () {
    $('.datetimepicker1').datetimepicker({ format: 'DD/MM/YYYY hh:mm:ss' });

    // end date greater than or equal to start date
	$("#startdate").on("dp.change",function (e) {
	    $('#enddate').data("DateTimePicker").minDate(e.date);	   
	});
	$("#enddate").on("dp.change",function (e) {
		$('#startdate').data("DateTimePicker").maxDate(e.date);
	});
	$('#users_select').multiselect();
});

$('.carousel').carousel();


  

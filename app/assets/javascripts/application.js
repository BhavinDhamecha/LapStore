//= require jquery
//= require jquery_ujs
//= require bootstrap/bootstrap-datepicker.min.js
//= require activestorage
//= require cocoon
//= require turbolinks

$('document').ready(function(){
	$("#datepicker").datepicker({ 
		format: 'dd/mm/yyyy',
    autoclose: true, 
    todayHighlight: true
  }).datepicker('update', new Date());
});
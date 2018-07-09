//= require rails-ujs
//= require jquery
//= require turbolinks
//= require_tree .
//= require bootstrap/dist/js/bootstrap.js
//= require admin-lte/dist/js/adminlte.js
//= require select2/dist/js/select2.js
//= require cocoon
//= require bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js

$(document).ready(function(){
  $(".select2").select2();
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
  });
})

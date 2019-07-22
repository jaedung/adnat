// This is a manifest file that"ll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin"s
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It"s not advisable to add code directly here, but if you do, it"ll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery.min
//= require popper.min
//= require bootstrap-material-design.min
//= require moment.min
//= require bootstrap-datetimepicker
//= require material-kit.min
//= require_tree .

$(function() {

  $(".datepicker").datetimepicker({
    format: "DD/MM/YYYY"
  })

  $('.timepicker').datetimepicker({
    format: 'hh:mm a',
    icons: {
      time: "fa fa-clock-o",
      date: "fa fa-calendar",
      up: "fa fa-chevron-up",
      down: "fa fa-chevron-down",
      previous: "fa fa-chevron-left",
      next: "fa fa-chevron-right",
      today: "fa fa-screenshot",
      clear: "fa fa-trash",
      close: "fa fa-remove"
    }
  });
});
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap

$(document).ajaxError(function(event, jqxhr) {
  if (jqxhr.status == 401) {
    window.location = '/';
  }
});

$(document).on('ajax:error', function(event) {
  if (event.detail[2].status === 401) {
    window.location = '/';
  }
});

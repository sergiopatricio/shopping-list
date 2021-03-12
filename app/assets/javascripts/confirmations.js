$(function() {
  $(document).on('ajax:success', '.confirmation-item .action', function(event) {
    $(this).closest('.confirmation-item').replaceWith(event.detail[0].html)
  });
});

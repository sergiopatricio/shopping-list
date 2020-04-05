$(function() {
  $(document).on('ajax:success', '.order-confirmation-item .action', function(event) {
    $(this).closest('.order-confirmation-item').replaceWith(event.detail[0].html)
  });
});

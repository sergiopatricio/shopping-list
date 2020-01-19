$(function() {
  $(document).on('ajax:success', '.shopping-cart-item .action', function(event, data) {
    $(this).closest('.shopping-cart-item').replaceWith(event.detail[0].html)
  });

  $(document).on('ajax:success', '.order-confirmation-item .action', function(event, data) {
    $(this).closest('.order-confirmation-item').replaceWith(event.detail[0].html)
  });
});

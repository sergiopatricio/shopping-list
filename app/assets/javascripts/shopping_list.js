$(function() {
  $(document).on('ajax:success', '.shopping-cart-item .action', function(event, data) {
    $(this).closest('.shopping-cart-item').html(event.detail[0].html)
  });
});

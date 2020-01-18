$(function() {
  $(document).on('ajax:success', '.shopping-cart-item .action', function(event, data) {
    $(this).closest('.shopping-cart-item').html(event.detail[0].html)
  });

  $(document).on('ajax:success', '.order-confirmation-item .action', function(event, data) {
    var $container = $(this).closest('.order-confirmation-item'),
        data = event.detail[0];
    $container.html(data.html).toggleClass('confirmed', data.confirmed)
  });
});

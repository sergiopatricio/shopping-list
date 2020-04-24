$(function() {
  $(document).on('ajax:success', '.shopping-list-item .action', function(event) {
    $(this).closest('.shopping-list-item').replaceWith(event.detail[0].html)
  });

  $('#add-temporary-item').on('show.bs.modal', function(event) {
    $.get($(event.relatedTarget).data('new-item-path'), function(data) {
      $('#add-temporary-item-loading').hide();
      $('#add-temporary-item-content').html(data.html);
      $('#item_name').trigger('focus');
    }).fail(function() {
      $('#add-temporary-item-loading').hide();
      $('#add-temporary-item-content').html('Error');
    });
  });

  $('#add-temporary-item').on('hidden.bs.modal', function() {
    $('#add-temporary-item-content').html('');
    $('#add-temporary-item-loading').show();
  });

  $(document).on('ajax:success', '.add-temporary-item-form', function(event) {
    var itemContent = $(event.detail[0].html);

    $('#shopping-list-group-' + itemContent.data('group-id')).append(itemContent);
    $('#add-temporary-item').modal('hide')
  });

  $(document).on('ajax:error', '.add-temporary-item-form', function(event) {
    if (event.detail[2].status === 400) {
      $('#add-temporary-item-content').html(event.detail[0].html);
    } else {
      $('#add-temporary-item-content').html('Error');
    }
  });
});

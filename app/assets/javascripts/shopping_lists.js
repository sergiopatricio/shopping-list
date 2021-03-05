$(function() {
  $(document).on('ajax:success', '.shopping-list-item .action', function(event) {
    $(this).closest('.shopping-list-item').replaceWith(event.detail[0].html)
  });

  $('#add-item').on('show.bs.modal', function(event) {
    $.get($(event.relatedTarget).data('new-item-path'), function(data) {
      $('#add-item-loading').hide();
      $('#add-item-content').html(data.html);
      $('#item_name').trigger('focus');
    }).fail(function() {
      $('#add-item-loading').hide();
      $('#add-item-content').html('Error');
    });
  });

  $('#add-item').on('hidden.bs.modal', function() {
    $('#add-item-content').html('');
    $('#add-item-loading').show();
  });

  $(document).on('ajax:success', '.edit-item', function(event) {
    const itemContent = $(event.detail[0].html);

    $('#shopping-list-group-' + itemContent.data('group-id')).append(itemContent);
    $('#add-item').modal('hide')
  });

  $(document).on('ajax:error', '.edit-item', function(event) {
    if (event.detail[2].status === 400) {
      $('#add-item-content').html(event.detail[0].html);
    } else {
      $('#add-item-content').html('Error');
    }
  });
});

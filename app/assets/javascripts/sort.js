$(function() {
  const sortable = Sortable.create(document.getElementById('sort-list'), {
    handle: '.sort-icon',
    onUpdate: function () {
      $('#ordered-ids').val(this.toArray())
    }
  });
  $('#ordered-ids').val(sortable.toArray())
});

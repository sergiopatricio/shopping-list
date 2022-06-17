import { Controller } from '@hotwired/stimulus'
import { Sortable } from 'sortablejs';

export default class extends Controller {
  connect() {
    const sortList = document.getElementById('sort-list');
    const orderedIds = document.getElementById('ordered-ids');

    const sortable = Sortable.create(sortList, {
      handle: '.sort-handle',
      onUpdate: function () {
        orderedIds.value = this.toArray();
      }
    });
    orderedIds.value = sortable.toArray();
  }
}

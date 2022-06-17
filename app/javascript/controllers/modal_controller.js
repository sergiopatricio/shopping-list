import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element);
    this.modal.show();
    this.element.addEventListener('hidden.bs.modal', function (event) {
      this.remove();
    });
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.modal.hide();
    }
  }
}

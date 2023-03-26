import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    const element = this.element;
    window.onscroll = function () {
      if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        element.style.display = 'block';
      } else {
        element.style.display = 'none';
      }
    };
  }

  jumpToTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
}

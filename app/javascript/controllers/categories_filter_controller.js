import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["cards"]

  connect() {
    fetch(`/filter_categories?category=all`, {
      headers: {
        "Accept": "text/html"
      }
    })
    .then(response => response.text())
    .then(html => {
        this.cardsTarget.innerHTML = html;

      })
    }

  filter(event) {
    event.preventDefault();

    document.querySelectorAll('.categories-item').forEach(item => {
      item.classList.remove('active-category');
    });
    event.currentTarget.classList.add('active-category');

    const category = event.currentTarget.dataset.category;

    fetch(`/filter_categories?category=${category}`, {
      headers: {
        "Accept": "text/html"
      }
    })
    .then(response => response.text())
    .then(html => {
        this.cardsTarget.innerHTML = html;

      })
  }
}

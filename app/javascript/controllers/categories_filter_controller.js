import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["locations", "locationBtn", "cards"]

  connect() {
    this.selectedCategory = 'all';
    this.selectedLocation = 'all';
    this.loadCards();
  }

  loadCards() {
    fetch(`/filter_categories?category=${this.selectedCategory}&location=${this.selectedLocation}`, {
      headers: {
        "Accept": "text/html"
      }
    })
    .then(response => response.text())
    .then(html => {
        this.cardsTarget.innerHTML = html;
      })
  }

  locations(event) {
    event.preventDefault();
    this.locationsTarget.classList.toggle("d-none");
    this.locationBtnTarget.classList.toggle("border-green");
  }

  filter(event) {
    event.preventDefault();

    document.querySelectorAll('.categories-item').forEach(item => {
      item.classList.remove('active-category');
    });
    event.currentTarget.classList.add('active-category');

    this.selectedCategory = event.currentTarget.dataset.category;
    this.loadCards();
  }

  filterByLocation(event) {
    event.preventDefault();

    document.querySelectorAll('.location-items').forEach(item => {
      item.classList.remove('active-location');
    });
    event.currentTarget.classList.add('active-location');

    this.selectedLocation = event.currentTarget.dataset.location;
    this.loadCards();
  }
}

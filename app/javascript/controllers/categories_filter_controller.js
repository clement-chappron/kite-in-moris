import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["locations", "locationBtn", "cards"];
  static values = { params: Object };

  connect() {
    this.selectedCategory = 'all';
    this.selectedLocation = 'All locations';
    this.params = {
      offset: 8,
      limit: 8
    };
    this.loadCards();
  }

  loadCards() {
    fetch(`/filter_categories?category=${this.selectedCategory}&location=${this.selectedLocation}&limitLoad=${this.params.limit}`, {
      headers: {
        "Accept": "text/html"
      }
    })
    .then(response => response.text())
    .then(html => {
      this.cardsTarget.innerHTML = html;
    })
    .catch(error => console.error('Error:', error));
  }

  locations(event) {
    event.preventDefault();

    this.locationsTarget.classList.toggle("d-none");
    this.locationBtnTarget.classList.toggle("border-green");

    document.querySelectorAll('.location-items').forEach(item => {
      item.classList.remove('active-location');
    });
    document.getElementById("all-locations").classList.add('active-location');

    this.selectedLocation = 'All locations';
    this.params = {
      offset: 8,
      limit: 8
    };

    this.loadCards();
  }

  filter(event) {
    event.preventDefault();

    document.querySelectorAll('.categories-item').forEach(item => {
      item.classList.remove('active-category');
    });
    event.currentTarget.classList.add('active-category');

    this.selectedCategory = event.currentTarget.dataset.category;
    this.params = {
      offset: 8,
      limit: 8
    };
    this.loadCards();
  }

  filterByLocation(event) {
    event.preventDefault();

    document.querySelectorAll('.location-items').forEach(item => {
      item.classList.remove('active-location');
    });
    event.currentTarget.classList.add('active-location');

    this.selectedLocation = event.currentTarget.dataset.location;
    this.params = {
      offset: 8,
      limit: 8
    };

    this.loadCards();
  }

  loadMore(event) {
    event.preventDefault();
    console.log('limit', this.params.limit);
    console.log('offset', this.params.offset);

    fetch(`/filter_categories?category=${this.selectedCategory}&location=${this.selectedLocation}&limitLoad=${this.params.limit}&offset=${this.params.offset}`, {
      headers: {
        "Accept": "text/html"
      }
    })
    .then(response => response.text())
    .then(html => {
      // Ajoute les nouveaux éléments à la page
      this.cardsTarget.insertAdjacentHTML('beforeend', html);

      // Mise à jour pour le prochain chargement
      this.params.offset += this.params.limit;
    })
  }
}

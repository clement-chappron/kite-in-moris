import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["locations", "locationBtn", "cards", "input", "burger", "profile"];
  static values = { params: Object };

  connect() {
    this.selectedCategory = 'all';
    this.selectedLocation = 'all locations';
    this.searchQuery = '';
    this.params = {
      offset: 9,
      limit: 9
    };

    this.loadCards();
  }

  loadCards() {
    fetch(`/filter_categories?category=${this.selectedCategory}&location=${this.selectedLocation}&limitLoad=${this.params.limit}&query=${this.searchQuery}`, {
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

  // Fonction pour gérer la recherche
  submit(event) {
    event.preventDefault();
    this.selectedCategory = 'all';
    this.selectedLocation = 'all locations';

    this.locationsTarget.classList.add("d-none");
    this.locationBtnTarget.classList.remove("border-green");

    document.querySelectorAll('.categories-item').forEach(item => {
      item.classList.remove('active-category');
    });
    document.getElementById('all').classList.add('active-category');

    this.searchQuery = this.inputTarget.value;
    document.getElementById('search').classList.add('d-none');
    document.getElementById('close-search').classList.remove('d-none');

    this.params.offset = 0;

    this.loadCards();
  }

  showSearch(event) {
    event.preventDefault();
    document.getElementById('search').classList.remove('d-none');
    document.getElementById('show-search').classList.add('d-none');
    document.getElementById('search-form').classList.remove('d-none');
    this.burgerTarget.classList.add('search-mobile');
    this.profileTarget.classList.add('search-mobile');
  }

  removeSearch(event) {
    event.preventDefault();
    this.searchQuery = '';
    this.inputTarget.value = '';

    document.getElementById('show-search').classList.remove('d-none');
    document.getElementById('close-search').classList.add('d-none');
    document.getElementById('search-form').classList.add('d-none');
    this.burgerTarget.classList.remove('search-mobile');
    this.profileTarget.classList.remove('search-mobile');

    this.params.offset = 0;

    this.loadCards();
  }

  locations(event) {
    event.preventDefault();

    this.locationsTarget.classList.toggle("d-none");
    this.locationBtnTarget.classList.toggle("border-green");

    document.querySelectorAll('.location-items').forEach(item => {
      item.classList.remove('active-location');
    });
    document.getElementById("all-locations").classList.add('active-location');

    this.selectedLocation = 'all locations';
    this.params = {
      offset: 9,
      limit: 9
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
      offset: 9,
      limit: 9
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
      offset: 9,
      limit: 9
    };

    this.loadCards();
  }

  loadMore(event) {
    event.preventDefault();
    console.log('limit', this.params.limit);
    console.log('offset', this.params.offset);

    fetch(`/filter_categories?category=${this.selectedCategory}&location=${this.selectedLocation}&limitLoad=${this.params.limit}&offset=${this.params.offset}&query=${this.searchQuery}`, {
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

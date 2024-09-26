import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="load-more"
export default class extends Controller {
  static targets = ["reviews", "btnLoadMore"];
  static values = { params: Object };

  connect() {
    // Récupérer le type de modèle (spot ou school) et le slug
    this.params = {
      modelType: this.element.dataset.loadMoreModelType, // 'spot' ou 'school'
      modelSlug: this.element.dataset.loadMoreModelSlug, // le slug du Spot ou de l'École
      offset: 5,
      limit: 5
    };
  }

  loadMore(event) {
    event.preventDefault();

    // Construction dynamique de l'URL en fonction du type de modèle (Spot ou School)
    const url = `/load_more?${this.params.modelType}_slug=${this.params.modelSlug}&limitLoad=${this.params.limit}&offset=${this.params.offset}`;

    fetch(url, {
      headers: {
        "Accept": "text/html"
      }
    })
    .then(response => response.text())
    .then(html => {
      // Ajoute les nouveaux éléments à la page
      this.reviewsTarget.insertAdjacentHTML('beforeend', html);

      // Mise à jour pour le prochain chargement
      this.params.offset += this.params.limit;  // Incrémenter l'offset

      // Vérifie s'il reste des reviews à charger
      const moreReviewsDiv = document.getElementById("more_reviews_exist");
      if (moreReviewsDiv && moreReviewsDiv.dataset.more === "false") {
        this.hideLoadMoreButton();
      }
    });
  }

  hideLoadMoreButton() {
    if (this.hasBtnLoadMoreTarget) {
      this.btnLoadMoreTarget.classList.add('d-none');
    }
  }
}

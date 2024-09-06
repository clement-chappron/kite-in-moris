import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="load-more"
export default class extends Controller {
  static targets = ["reviews", "btnLoadMore"];
  static values = { params: Object };

  connect() {
    this.params = {
      spot_slug: this.element.dataset.loadMoreSpotSlug,
      offset: 5,
      limit: 5
    };
  }

  loadMore(event) {
    event.preventDefault();

    fetch(`/load_more?spot_slug=${this.params.spot_slug}&limitLoad=${this.params.limit}&offset=${this.params.offset}`, {
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

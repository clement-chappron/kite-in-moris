import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="load-more-shop-review"
export default class extends Controller {
  static targets = ["reviews", "btnLoadMore"];
  static values = { shopId: Number, params: Object };

  connect() {
    this.params = {
      shop_id: Number(this.shopIdValue),
      offset: 5,
      limit: 5
    };
  }

  loadMoreShopReview(event) {
    event.preventDefault();

    fetch(`/load_more_shop_reviews?shop_id=${this.params.shop_id}&limitLoad=${this.params.limit}&offset=${this.params.offset}`, {
      headers: {
        "Accept": "text/html"
      }
    })
    .then(response => response.text())
    .then(html => {
      this.reviewsTarget.insertAdjacentHTML('beforeend', html);
      this.params.offset += this.params.limit;

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

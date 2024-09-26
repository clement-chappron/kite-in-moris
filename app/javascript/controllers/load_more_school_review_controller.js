import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="load-more-school-review"
export default class extends Controller {
  static targets = ["reviews", "btnLoadMore"];
  static values = { schoolId: Number, params: Object };

  connect() {
    this.params = {
      school_id: Number(this.schoolIdValue),
      offset: 5,
      limit: 5
    };
  }

  loadMoreSchoolReview(event) {
    event.preventDefault();

    fetch(`/load_more_school_reviews?school_id=${this.params.school_id}&limitLoad=${this.params.limit}&offset=${this.params.offset}`, {
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

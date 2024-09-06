import { Controller } from "@hotwired/stimulus"

// Connecte le contrôleur à data-controller="images-show"
export default class extends Controller {
  static targets = [ "secondImage", "imageContainer" ]

  connect() {
      this.centerImageInViewport();
  }

  centerImageInViewport() {
    setTimeout(() => {
      const image = this.secondImageTarget;
      const viewportWidth = window.innerWidth;
      const imageCenterOffset = image.offsetLeft + (image.offsetWidth / 2);
      const viewportCenter = viewportWidth / 2;
      const scrollPosition = imageCenterOffset - viewportCenter;

      this.imageContainerTarget.scrollLeft = scrollPosition;
    }, 1000);
  }
}

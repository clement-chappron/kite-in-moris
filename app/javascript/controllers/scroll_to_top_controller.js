import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-to-top"
export default class extends Controller {
  connect() {
    console.log('ScrollToTopController connected!');
    this.scrollToTopButton = document.getElementById('scrollToTop');
    console.log('Hello, Stimulus!', this.scrollToTopButton);

      window.addEventListener('scroll', () => {
          if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
            this.scrollToTopButton.classList.add("visible");
          } else {
            this.scrollToTopButton.classList.remove("visible");
          }
      });

      // Défilement vers le haut au clic
      this.scrollToTopButton.addEventListener('click', () => {
          window.scrollTo({ top: 0, behavior: 'smooth' });
      });
  }
}

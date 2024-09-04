import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories-filter"
export default class extends Controller {
  static targets = ["cards"]

  filter(event) {
    event.preventDefault();

    const category = event.currentTarget.dataset.category;

    fetch(`/filter_categories?category=${category}`, {
      headers: {
        "Accept": "text/html"  // Change to accept normal HTML
      }
    })
    .then(response => response.text())
    .then(html => {
      console.log(html);  // Vérifie le contenu HTML
      console.log(this.cardsTarget);  // Vérifie que l'élément cardsTarget existe

      if (this.cardsTarget) {
        this.cardsTarget.innerHTML = html;  // Injecte le HTML dans cardsTarget
        console.log("HTML injecté avec succès dans cardsTarget");
      } else {
        console.error("cardsTarget est null ou non défini");
      }
    })
    .catch(error => {
      console.error('Il y a eu une erreur!', error);
    });
  }

}

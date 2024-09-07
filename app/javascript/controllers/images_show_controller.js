// import { Controller } from "@hotwired/stimulus"

// // Connecte le contrôleur à data-controller="images-show"
// export default class extends Controller {
//   static targets = [ "secondImage", "imageContainer" ]

//   connect() {
//       this.centerImageInViewport();
//   }

//   centerImageInViewport() {
//     setTimeout(() => {
//       const image = this.secondImageTarget;
//       const viewportWidth = window.innerWidth;
//       const imageCenterOffset = image.offsetLeft + (image.offsetWidth / 2);
//       const viewportCenter = viewportWidth / 2;
//       const scrollPosition = imageCenterOffset - viewportCenter;

//       this.imageContainerTarget.scrollLeft = scrollPosition;
//     }, 1000);
//   }
// }


import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["secondImage", "imageContainer"]
  // Méthode appelée automatiquement quand le contrôleur est connecté à la page (lorsque
  // la page se charge).
  connect() {
    // On appelle la méthode pour charger l'image et la centrer.
    this.loadAndCenterImage();
    // On ajoute un écouteur d'événements sur le redimensionnement de la fenêtre. Chaque fois que la
    // fenêtre est redimensionnée, on appelle la méthode `centerImageInViewport` après un court délai
    // (grâce à la fonction `debounce` qui empêche de l'appeler trop souvent).
    window.addEventListener("resize", this.debounce(this.centerImageInViewport.bind(this), 100));
  }
  // Cette méthode vérifie si l'image est déjà complètement chargée.
  // Si l'image est chargée, on appelle immédiatement `centerImageInViewport` pour la centrer.
  // Sinon, on attend l'événement `load` pour centrer l'image une fois qu'elle est prête.
  loadAndCenterImage() {
    const image = this.secondImageTarget;
    // Vérifie si l'image est déjà chargée (propriété `complete`).
    if (image.complete) {
      // Si l'image est déjà chargée, on la centre directement.
      this.centerImageInViewport();
    } else {
      // Si l'image n'est pas encore chargée, on attend qu'elle soit complètement chargée avant de la centrer.
      image.addEventListener("load", () => this.centerImageInViewport());
    }
  }
  centerImageInViewport() {
    const image = this.secondImageTarget;
    const container = this.imageContainerTarget;
    const viewportWidth = window.innerWidth;
    const imageCenterOffset = image.offsetLeft + (image.offsetWidth / 2);
    const viewportCenter = viewportWidth / 2;
    const scrollPosition = imageCenterOffset - viewportCenter;
    container.scrollLeft = scrollPosition;
  }
  // Cette fonction utilitaire permet de "debouncer" un événement.
  // Cela signifie qu'elle limite la fréquence d'exécution d'une fonction en attendant un court délai
  // après la dernière fois que l'événement s'est produit (ici, 100 millisecondes).
  debounce(func, wait) {
    let timeout;
    return (...args) => {
      clearTimeout(timeout);  // Supprime tout délai précédent.
      // Déclenche la fonction `func` après le délai spécifié (ici `wait`).
      timeout = setTimeout(() => func.apply(this, args), wait);
    };
  }
  // Cette méthode est appelée lorsque le contrôleur est déconnecté de la page (par exemple, quand on
  // quitte la page). Ici, elle retire l'écouteur d'événements pour éviter les fuites de mémoire.
  disconnect() {
    // Retire l'écouteur d'événements "resize" quand on quitte la page ou quand le contrôleur est déchargé.
    window.removeEventListener("resize", this.debounce(this.centerImageInViewport.bind(this), 100));
  }
}

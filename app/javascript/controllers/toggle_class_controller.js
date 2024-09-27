import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-class"
export default class extends Controller {
  connect() {
    const btn1 = document.getElementById('btn1');
    const btn2 = document.getElementById('btn2');

    if (btn1 && btn2) {
      // Au survol du bouton 1
      // btn1.addEventListener('mouseover', () => {
      //   this.toggleClasses(btn1, btn2);
      // });

      // btn1.addEventListener('mouseout', () => {
      //   this.resetClasses(btn1, btn2);
      // });

      // Au survol du bouton 2
      btn2.addEventListener('mouseover', () => {
        this.toggleClasses(btn1, btn2);
      });

      btn2.addEventListener('mouseout', () => {
        this.resetClasses(btn1, btn2);
      });
    }
  }

  // Fonction pour échanger les classes au survol
  toggleClasses(activeBtn, inactiveBtn) {
    activeBtn.classList.remove('btn-bg-primary');
    activeBtn.classList.add('btn-bg-opacity');

    inactiveBtn.classList.remove('btn-bg-opacity');
    inactiveBtn.classList.add('btn-bg-primary');
  }

  // Fonction pour rétablir les classes originales après le survol
  resetClasses(btn1, btn2) {
    btn1.classList.remove('btn-bg-opacity');
    btn1.classList.add('btn-bg-primary');

    btn2.classList.remove('btn-bg-primary');
    btn2.classList.add('btn-bg-opacity');
  }
}

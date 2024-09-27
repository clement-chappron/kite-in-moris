import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
    connect() {
        const options = {
            strings: ["<br>Hello!", "Nice to meet you!", "<br>We are Kite in Moris!", "Everything you need about kitesurf in Mauritius.", "Find a school, the best spot, or your gear.", "Find your accommodation and best restaurants.", "Participate in an event with your friends.", "Join our community, with happiness.", "Live your dream in kite paradise.", "<br>We are Kite in Moris!"],
            typeSpeed: 37,
            backSpeed: 10,
            showCursor: false,
            loop: false,
            onComplete: (self) => {
              const fixedText = "<br>We are Kite in Moris!"; // Le texte fixe que vous voulez afficher
              const element = document.querySelector(".element-to-animate");
              element.innerHTML += `<span>${fixedText}</span>`;
          }

        };

        const typed = new Typed(this.element, options);
    }
}

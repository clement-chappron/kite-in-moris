import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-company"
export default class extends Controller {
  static targets = ["step1", "step2", "step3", "step4", "step5"]


  connect() {
    this.step1Target.classList.remove("d-none");
    this.step2Target.classList.add("d-none");
    this.step3Target.classList.add("d-none");
    this.step4Target.classList.add("d-none");
    this.step5Target.classList.add("d-none");
  }


  step1(event) {
    event.preventDefault();
    this.step1Target.classList.add("d-none");
    this.step2Target.classList.remove("d-none");
  }

  step2(event) {
    event.preventDefault();
    this.step2Target.classList.add("d-none");
    this.step3Target.classList.remove("d-none");
  }

  step3(event) {
    event.preventDefault();
    this.step3Target.classList.add("d-none");
    this.step4Target.classList.remove("d-none");
  }

  step4(event) {
    event.preventDefault();
    this.step4Target.classList.add("d-none");
    this.step5Target.classList.remove("d-none");
  }


  backStep1(event) {
    event.preventDefault();
    this.step1Target.classList.remove("d-none");
    this.step2Target.classList.add("d-none");
  }

  backStep2(event) {
    event.preventDefault();
    this.step2Target.classList.remove("d-none");
    this.step3Target.classList.add("d-none");
  }

  backStep3(event) {
    event.preventDefault();
    this.step3Target.classList.remove("d-none");
    this.step4Target.classList.add("d-none");
  }

  backStep4(event) {
    event.preventDefault();
    this.step4Target.classList.remove("d-none");
    this.step5Target.classList.add("d-none");
  }

}

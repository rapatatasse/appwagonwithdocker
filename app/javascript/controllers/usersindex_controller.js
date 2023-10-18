import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "liproduct"]

  hiddenproduct() {
    console.log("clic2");
    this.liproductTargets.forEach(li => {
      console.log(li);
      li.style.display = "none";
    });
  }
}
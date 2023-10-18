import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output"]

  greet() {
    console.log("clic1");
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
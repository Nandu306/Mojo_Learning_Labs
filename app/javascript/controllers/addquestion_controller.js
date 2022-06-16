import { Controller } from "stimulus"

export default class extends Controller {

  static targets = [ "card" ]

  show() {
    this.cardTarget.classList.remove('d-none')
  }
}

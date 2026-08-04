import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "backdrop", "button"]

  connect() {
    this.close()
  }

  toggle(event) {
    event?.preventDefault()
    if (this.panelTarget.hidden) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.panelTarget.hidden = false
    this.backdropTarget.hidden = false
    this.buttonTarget.setAttribute("aria-expanded", "true")
    document.body.classList.add("has-menu-open")
  }

  close() {
    this.panelTarget.hidden = true
    this.backdropTarget.hidden = true
    this.buttonTarget.setAttribute("aria-expanded", "false")
    document.body.classList.remove("has-menu-open")
  }

  backdropClose(event) {
    if (event.target === this.backdropTarget) this.close()
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label"]
  static values = {
    active: Boolean,
    activeLabel: String,
    inactiveLabel: String
  }

  connect() {
    this.render()
  }

  toggle(event) {
    event.preventDefault()
    this.activeValue = !this.activeValue
    this.render()
  }

  activeValueChanged() {
    this.render()
  }

  render() {
    this.element.classList.toggle("is-active", this.activeValue)
    this.element.setAttribute("aria-pressed", this.activeValue)

    if (this.hasLabelTarget) {
      this.labelTarget.textContent = this.activeValue ? this.activeLabelValue : this.inactiveLabelValue
    }
  }
}

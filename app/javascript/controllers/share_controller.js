import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    shareText: String,
    shareUrl: String
  }

  async share(event) {
    event.preventDefault()

    const shareData = {
      text: this.shareTextValue,
      title: this.shareTextValue,
      url: this.shareUrlValue
    }

    if (navigator.share) {
      await navigator.share(shareData)
      return
    }

    if (navigator.clipboard?.writeText) {
      await navigator.clipboard.writeText(this.shareUrlValue)
    }

    this.element.textContent = "URLをコピーしました"
    window.setTimeout(() => {
      this.element.textContent = "SNSシェア"
    }, 1800)
  }
}

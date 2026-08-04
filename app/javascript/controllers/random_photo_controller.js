import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "authorAvatar",
    "authorLink",
    "authorName",
    "authorHandle",
    "caption",
    "detailLink",
    "image",
    "likeButton",
    "likeLabel",
    "photoTime",
    "shareButton",
    "status",
    "title",
    "followButton",
    "followLabel"
  ]

  static values = {
    index: Number,
    photos: Array,
    touchStartX: Number
  }

  connect() {
    if (!this.hasIndexValue) this.indexValue = 0
    this.render()
  }

  next(event) {
    event?.preventDefault()

    if (this.photosValue.length < 2) return

    let nextIndex = this.indexValue
    while (nextIndex === this.indexValue) {
      nextIndex = Math.floor(Math.random() * this.photosValue.length)
    }

    this.indexValue = nextIndex
    this.render()
  }

  keydown(event) {
    if (event.key === "ArrowRight" || event.key === "ArrowLeft") {
      event.preventDefault()
      this.next()
    }
  }

  touchStart(event) {
    const touch = event.touches?.[0] || event.changedTouches?.[0]
    if (touch) this.touchStartXValue = touch.clientX
  }

  touchEnd(event) {
    const touch = event.changedTouches?.[0]
    if (!touch || this.touchStartXValue == null) return

    const delta = touch.clientX - this.touchStartXValue
    if (Math.abs(delta) >= 40) {
      this.next()
    }
  }

  toggleLike(event) {
    event.preventDefault()
    this.currentPhoto().liked = !this.currentPhoto().liked
    this.render()
  }

  toggleFollow(event) {
    event.preventDefault()
    this.currentPhoto().following = !this.currentPhoto().following
    this.render()
  }

  render() {
    const photo = this.currentPhoto()
    if (!photo) return

    this.imageTarget.src = photo.image_url
    this.imageTarget.alt = photo.title
    this.authorAvatarTarget.src = photo.author_avatar_url
    this.authorAvatarTarget.alt = photo.author_name
    this.authorLinkTarget.href = photo.author_url
    this.authorNameTarget.textContent = photo.author_name
    this.authorHandleTarget.textContent = photo.author_handle
    this.titleTarget.textContent = photo.title
    this.captionTarget.textContent = photo.caption
    this.photoTimeTarget.textContent = photo.published_at_label
    this.detailLinkTarget.href = photo.detail_url
    this.detailLinkTarget.textContent = "詳細を見る"
    this.shareButtonTarget.dataset.shareUrlValue = photo.share_url
    this.shareButtonTarget.dataset.shareTextValue = `${photo.title} / ${photo.author_name}`
    this.statusTarget.textContent = photo.mood

    this.syncToggle(this.likeButtonTarget, this.likeLabelTarget, photo.liked, "いいね済み", "いいね")
    this.syncToggle(this.followButtonTarget, this.followLabelTarget, photo.following, "フォロー中", "フォロー")
  }

  syncToggle(button, label, active, activeText, inactiveText) {
    button.classList.toggle("is-active", active)
    button.setAttribute("aria-pressed", String(active))
    label.textContent = active ? activeText : inactiveText
  }

  currentPhoto() {
    return this.photosValue[this.indexValue]
  }
}

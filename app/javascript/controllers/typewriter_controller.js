import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["text"]
    static values = {
        message: { type: String, default: "Welcome to My Academy Quest! Track your progress here." },
        speed: { type: Number, default: 50 }
    }

    connect() {
        this.index = 0
        this.typeText()
    }

    typeText() {
        if (this.index < this.messageValue.length) {
            this.textTarget.innerHTML += this.messageValue.charAt(this.index)
            this.index++
            setTimeout(() => this.typeText(), this.speedValue)
        }
    }
}

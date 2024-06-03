import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quantity-button"
export default class extends Controller {
  static targets = ["input", "label", "minusButton", "addButton"];

  connect() {
    this.qtyMin = parseInt(this.inputTarget.getAttribute("min"));
    this.qtyMax = parseInt(this.inputTarget.getAttribute("max"));
  }

  increment(event) {
    // increase the label value
    // increase the input value
    this.updateQuantity(1);
  }

  decrement(event) {
    this.updateQuantity(-1);
  }

  updateQuantity(amount) {
    let qty = parseInt(this.inputTarget.value) + amount;

    if (qty <= this.qtyMin) {
      qty = this.qtyMin;
      this.minusButtonTarget.setAttribute("disabled", true);
    } else {
      this.minusButtonTarget.removeAttribute("disabled");
    }

    if (qty >= this.qtyMax) {
      qty = this.qtyMax;
      this.addButtonTarget.setAttribute("disabled", true);
    } else {
      this.addButtonTarget.removeAttribute("disabled");
    }

    this.labelTarget.innerText = qty;
    this.inputTarget.value = qty;
  }
}

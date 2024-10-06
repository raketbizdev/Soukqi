import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!";

    // Add the async event listener here if it targets an action involving this controller's element
    this.element.addEventListener("eventName", async (event) => {
      try {
        const result = await asyncFunction();
        console.log(result);
      } catch (error) {
        console.error("Async error:", error);
      }
    });
  }
}

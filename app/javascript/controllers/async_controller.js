import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  async doSomething() {
    try {
      const result = await asyncFunction();
      console.log(result);
    } catch (error) {
      console.error("Async error:", error);
    }
  }
}

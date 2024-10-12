// app/javascript/application.js
import { Turbo } from "@hotwired/turbo-rails"
import "./controllers";
import * as bootstrap from "bootstrap";
import * as Popper from "@popperjs/core";
import "bootstrap-icons/font/bootstrap-icons.css";

import Rails from "@rails/ujs";  // Add this line to import Rails UJS
Rails.start();  // Start Rails UJS


// Counter Animation Script
document.addEventListener("DOMContentLoaded", () => {
  Turbo.start()

  document.addEventListener("eventName", async (event) => {
    try {
      const result = await asyncFunction(); // Ensure this function is defined or imported
      console.log(result);
    } catch (error) {
      console.error("Async error:", error);
    }
  });

  const counters = document.querySelectorAll(".counter");
  counters.forEach((counter) => {
    counter.innerText = "0";
    const updateCounter = () => {
      const target = +counter.getAttribute("data-target");
      const count = +counter.innerText;
      const increment = target / 200; // Adjust for speed

      if (count < target) {
        counter.innerText = `${Math.ceil(count + increment)}`;
        setTimeout(updateCounter, 15);
      } else {
        counter.innerText = target;
      }
    };
    updateCounter();
  });
});

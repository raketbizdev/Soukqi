// app/javascript/application.js
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";
import * as Popper from "@popperjs/core";
import "bootstrap-icons/font/bootstrap-icons.css"; // Import the Bootstrap Icons CSS

// Counter Animation Script
document.addEventListener("DOMContentLoaded", () => {
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
  
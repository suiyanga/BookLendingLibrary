// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
Rails.start()


document.addEventListener("turbo:load", function() {
    document.querySelectorAll('a[data-method="delete"]').forEach((element) => {
      element.addEventListener("click", function(event) {
        event.preventDefault();
        let form = document.createElement("form");
        form.method = "POST";
        form.action = this.href;
  
        let csrfToken = document.querySelector('meta[name="csrf-token"]').content;
        let csrfInput = document.createElement("input");
        csrfInput.type = "hidden";
        csrfInput.name = "authenticity_token";
        csrfInput.value = csrfToken;
        form.appendChild(csrfInput);
  
        let methodInput = document.createElement("input");
        methodInput.type = "hidden";
        methodInput.name = "_method";
        methodInput.value = "delete";
        form.appendChild(methodInput);
  
        document.body.appendChild(form);
        form.submit();
      });
    });
  });
  
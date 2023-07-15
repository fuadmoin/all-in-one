// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.querySelector('.closebtn').addEventListener('click', function() {
    this.parentElement.style.display = 'none';
  });
  
  document.querySelector('form').addEventListener('submit', function(event) {
    let checkboxes = document.querySelectorAll('input[type="checkbox"]');
    let checked = Array.from(checkboxes).some(checkbox => checkbox.checked);
    if (!checked) {
      event.preventDefault();
      document.querySelector('.alert').style.display = 'block';
    }
  });
  
  
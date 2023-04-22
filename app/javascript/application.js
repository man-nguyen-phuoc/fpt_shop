// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const button = document.getElementById('moca-111-tab');
const div = document.getElementById('moca-111');

button.addEventListener('mouseover', () => {
  div.innerHTML = '<p>70% discount when paying via moca wallet on grap app.</p>'
  console.log('Mouseover event triggered!');
});
const button = document.getElementById('moca-111-tab');
const div = document.getElementById('moca-111');
debugger;
button.addEventListener('mouseover', () => {
  div.innerHTML = '<p>70% discount when paying via moca wallet on grap app.</p>'
  console.log('Mouseover event triggered!');
});
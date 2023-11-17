const cards = document.querySelectorAll('.cards .card');

function pauseAnimations() {
  cards.forEach(card => {
    card.style.animationPlayState = 'paused';
  });
}

function resumeAnimations() {
  cards.forEach(card => {
    card.style.animationPlayState = 'running';
  });
}

cards.forEach(card => {
  card.addEventListener('mouseover', pauseAnimations);
  card.addEventListener('mouseout', resumeAnimations);
});
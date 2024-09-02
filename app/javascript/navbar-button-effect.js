const menuWrapper = document.querySelector('.menu-wrapper');
const hamburgerMenu = document.querySelector('.hamburger-menu');
const hamburgerBg = document.querySelector('.hamburger-bg');

menuWrapper.addEventListener('click', () => {
  hamburgerMenu.classList.toggle('animate');
  }
);
hamburgerBg.addEventListener('mouseover', () => {
  hamburgerBg.classList.add('animate');
});

hamburgerBg.addEventListener('mouseout', () => {
  hamburgerBg.classList.remove('animate');
});
hamburgerMenu.addEventListener('mouseover', () => {
  hamburgerBg.classList.add('animate');
});

hamburgerMenu.addEventListener('mouseout', () => {
  hamburgerBg.classList.remove('animate');
});

const menuWrapper = document.querySelector('.menu-wrapper');
const hamburgerMenu = document.querySelector('.hamburger-menu');

menuWrapper.addEventListener('click', () => {
  hamburgerMenu.classList.toggle('animate');
  }
);

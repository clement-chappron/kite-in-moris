(function() {
  // Animation de la navbar
  const navbarBurger = document.getElementById('navbar-burger-id');
  const navbarBtn = document.getElementById('navbar-btn');

  function toggleNavbar() {
    navbarBurger.classList.toggle('active');
  }

  navbarBtn.addEventListener('click', toggleNavbar);

  // Animation du bouton de la navbar
  const menuWrapper = document.querySelector('.menu-wrapper');
  const hamburgerMenu = document.querySelector('.hamburger-menu');
  const hamburgerBg = document.querySelector('.hamburger-bg');

  menuWrapper.addEventListener('click', () => {
    hamburgerMenu.classList.toggle('animate');
  });

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
})();

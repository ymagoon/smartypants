function showNavBar(event) {
  console.log(event);
  event.classList.add('open');
}

function hideNavBar(event) {
  event.classList.remove('open');
}

function navBarShowHide() {
  const navbar = document.querySelector('.navbaritem');
  navbar.addEventListener('mouseover', showNavBar);
  navbar.addEventListener('mouseout', hideNavBar);
  console.log('semi works');
}

export { navBarShowHide };

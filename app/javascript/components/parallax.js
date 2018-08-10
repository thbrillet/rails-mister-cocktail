function scrollFunc() {
  const windowScroll = this.scrollY;

  const $logo = document.getElementsByClassName('main-el')[0];
  $logo.style.transform = 'translateY(-' + windowScroll/4 + '%)';

  const $backBird = document.getElementsByClassName('back-el')[0];
  $backBird.style.transform = 'translateY(' + windowScroll/4 + '%)';

  const $foreBird = document.getElementsByClassName('fore-el')[0];
  $foreBird.style.transform = 'translateY(-' + windowScroll/2 + '%)';
}

window.addEventListener('scroll', scrollFunc);


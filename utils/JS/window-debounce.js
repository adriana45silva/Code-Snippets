// Window debounce - check if user is resizing the screen

var resizeTimer;

window.addEventListener('resize', (event) => {
  clearTimeout(resizeTimer);
  resizeTimer = setTimeout ( () => {
    console.log('resizing!')
  }, 250);
});
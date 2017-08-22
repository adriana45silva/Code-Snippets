export const debounce = (func, wait, immediate) => {
  let timeout;
  return (...funcArgs) => {
    let args = funcArgs;
    let later = function() {
      timeout = null;
      if (!immediate) func.apply(this, args);
    };
    let callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
    if (callNow) func.apply(this, args);
  };
};
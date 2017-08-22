export const isMatchMedia = (minSize, maxSize = 0) => {
  let windowWidth = window.innerWidth;
  if (
    (windowWidth >= parseInt(minSize) && windowWidth < parseInt(maxSize)) ||
    (windowWidth >= parseInt(minSize) && parseInt(maxSize) === 0)
  ) {
    return true;
  } else {
    return false;
  }
};
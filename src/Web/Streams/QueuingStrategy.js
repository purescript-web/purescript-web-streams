const newImpl = function (options) {
  return function() {
    return new QueuingStrategy(options);
  };
};
export { newImpl as new };

export function byteLengthQueuingStrategy(options) {
  return function() {
    return new ByteLengthQueuingStrategy(options);
  };
}

export function countQueuingStrategy(options) {
  return function() {
    return new CountQueuingStrategy(options);
  };
}

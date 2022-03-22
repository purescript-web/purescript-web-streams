"use strict";

export function new(options) {
  return function() {
    return new QueuingStrategy(options);
  };
}

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

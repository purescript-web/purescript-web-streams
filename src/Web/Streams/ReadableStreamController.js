"use strict";

export function enqueue(chunk) {
  return function(controller) {
    return function() {
      return controller.enqueue(chunk);
    };
  };
}

export function close(controller) {
  return function() {
    return controller.close();
  };
}

export function error(error) {
  return function(controller) {
    return function() {
      return controller.error(error);
    };
  };
}

export function desiredSize(controller) {
  return function() {
    return controller.desiredSize;
  };
}

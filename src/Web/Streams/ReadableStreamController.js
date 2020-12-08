"use strict";

exports.enqueue = function(chunk) {
  return function(controller) {
    return function() {
      return controller.enqueue(chunk);
    };
  };
};

exports.close = function(controller) {
  return function() {
    return controller.close();
  };
};

exports.error = function(error) {
  return function(controller) {
    return function() {
      return controller.error(error);
    };
  };
};

exports.desiredSize = function(controller) {
  return function() {
    return controller.desiredSize;
  };
};

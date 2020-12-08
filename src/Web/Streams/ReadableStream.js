"use strict";

exports._new = function(source, strategy) {
  return new ReadableStream(source, strategy);
};

exports.cancel = function(stream) {
  return function() {
    return stream.cancel();
  };
};

exports.locked = function(stream) {
  return function() {
    return stream.locked;
  };
};

exports.getReader = function(stream) {
  return function() {
    return stream.getReader();
  };
};

exports._tee = function(tuple, stream) {
  var r = stream.tee();
  return tuple(r[0])(r[1]);
};

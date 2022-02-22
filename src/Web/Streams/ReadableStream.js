"use strict";

export function _new(source, strategy) {
  return new ReadableStream(source, strategy);
}

export function cancel(stream) {
  return function() {
    return stream.cancel();
  };
}

export function locked(stream) {
  return function() {
    return stream.locked;
  };
}

export function getReader(stream) {
  return function() {
    return stream.getReader();
  };
}

export function _tee(tuple, stream) {
  var r = stream.tee();
  return tuple(r[0])(r[1]);
}

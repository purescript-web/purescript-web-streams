export function _new(source, strategy) {
  return new WritableStream(source, strategy);
}

export function close(stream) {
  return function() {
    return stream.close();
  };
}

export function _abortErr(stream, reason) {
  return function() {
    return stream.abort(reason);
  };
}

export function abort(stream) {
  return function() {
    return stream.abort();
  };
}

export function locked(stream) {
  return function() {
    return stream.locked;
  };
}

export function getWriter(stream) {
  return function() {
    return stream.getWriter();
  };
}

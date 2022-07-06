export function _write(writer, chunk) {
  return function() {
    return writer.write(chunk);
  };
}

export function close(writer) {
  return function() {
    return writer.close();
  };
}

export function closed(writer) {
  return function() {
    return writer.closed;
  };
}

export function _desiredSize(writer) {
  return function() {
    return writer.desiredSize;
  };
}

export function ready(writer) {
  return function() {
    return writer.ready;
  };
}

export function releaseLock(writer) {
  return function() {
    return writer.releaseLock();
  };
}

export function abort(writer) {
  return function() {
    return writer.abort();
  };
}

export function _abortErr(writer, err) {
  return function() {
    return writer.abort(err);
  };
}

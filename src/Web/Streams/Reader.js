exports._read = function(nothing, just, reader) {
  return reader.read().then(function(res) {
    if (res.done) {
      return nothing;
    }
    return just(res.value);
  });
};
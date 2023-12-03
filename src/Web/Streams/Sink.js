export function _make(options) {
  var newOptions = {};
  if (options.start) {
    newOptions.start = function(controller) {
      return options.start(controller)();
    };
  }
  if (options.write) {
    newOptions.write = function(chunk, controller) {
      return options.write(chunk)(controller)();
    };
  }
  if (options.close) {
    newOptions.close = function(controller) {
      return options.close(controller)();
    };
  }
  if (options.abort) {
    newOptions.abort = function(reason) {
      return options.abort(reason)();
    };
  }
  return newOptions;
}

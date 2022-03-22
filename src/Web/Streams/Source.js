export function _make(options) {
  var newOptions = {
    start: function(controller) {
      return options.start(controller)();
    }
  };
  if (options.pull) {
    newOptions.pull = function(controller) {
      return options.pull(controller)();
    };
  }
  if (options.cancel) {
    newOptions.cancel = function() {
      return options.cancel();
    };
  }
  return newOptions;
}

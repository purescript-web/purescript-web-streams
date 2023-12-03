export function error(error) {
  return function(controller) {
    return function() {
      return controller.error(error);
    };
  };
}

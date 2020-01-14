exports.new = function(options) {
  return function() {
    return new QueuingStrategy(options);
  };
};

exports.byteLengthQueuingStrategy = function(options) {
  return function() {
    return new ByteLengthQueuingStrategy(options);
  };
};

exports.countQueuingStrategy = function(options) {
  return function() {
    return new CountQueuingStrategy(options);
  };
};
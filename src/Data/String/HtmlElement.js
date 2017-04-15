var he = require('he');

exports["encode'"] = function (options) {
  return function (string) {
    return he.encode(string, options);
  };
};

exports["decode'"] = function (options) {
  return function(string) {
    return he.decode(string, options);
  };
};

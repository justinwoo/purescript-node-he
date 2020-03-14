var he = require('he');

exports.encodeWith = function (options) {
  return function (string) {
    return he.encode(string, options);
  };
};

exports.decodeWith = function (options) {
  return function(string) {
    return he.decode(string, options);
  };
};

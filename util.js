
module.exports.rowtojson = rowtojson = function (data) { // TE stands for Throw Error
  return JSON.parse(JSON.stringify(data))
};
exports.handleMessage = function(message, callback) {
  if(message.text.match(/time\.com/i) && message.name == "Jon Fein") {
    callback("*crickets*");
  }
}

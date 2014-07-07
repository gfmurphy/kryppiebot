exports.handleMessage = function(message, callback) {
  if(message.text.match(/time\.com/i) && message.name == "Jon Fein") {
    callback("*crickets*");
  }
  else if(message.text.match(/\s*RIP\s+/) && 
          message.name != "KryppieBot" &&
          message.name != "Jake Maeroff") {
    callback("Jake, you slipping?");
  }
}

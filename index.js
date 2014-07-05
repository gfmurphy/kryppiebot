var bot = require('fancy-groupme-bot');
var util = require('util');
var messageHandler = require("./message-handler")

const CONFIG = {
    token: process.env["TOKEN"],
    group: process.env["GROUP"],
    name:  process.env["NAME"],
    url:   process.env["URL"]
}

var kryppiebot = bot(CONFIG);

kryppiebot.on('botMessage', function(b, message) {
  messageHandler.handleMessage(message, function(resp) {
    b.message(resp);
  });
});

var port = process.env.PORT || 5000
kryppiebot.serve(port);

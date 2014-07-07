var messageHandler = require("../message-handler");

describe("handleMessage", function() {
  it("responds to messages from Jon Fein containing time.com", function() {
    var message = { name: "Jon Fein", text: "Checkout time.com for article" }
    messageHandler.handleMessage(message, function(resp) {
      expect(resp).toEqual("*crickets*");
    })
  })

  it("responds to messages not from Jake Maeroff containing RIP", function() {
    var message = {name: "Jon Fein", text: "RIP Steve Buschemi"};
    messageHandler.handleMessage(message, function(resp) {
      expect(resp).toEqual("Jake, you slipping?");
    })
  })
})

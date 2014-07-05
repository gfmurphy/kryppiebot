var messageHandler = require("../message-handler");

describe("handleMessage", function() {
  it("responds to messages from Jon Fein containing time.com", function() {
    var message = { name: "Jon Fein", text: "Checkout time.com for article" }
    messageHandler.handleMessage(message, function(resp) {
      expect(resp).toBe("*crickets*");
    })
  })
})

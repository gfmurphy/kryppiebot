ENV["RACK_ENV"] = "test"

$:.unshift(File.join(File.dirname(__FILE__), ".."))

require "rack/test"
require "test/unit"
require "kryppie_bot"

class KryppieBotTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_response_code
    post "/"
    assert_equal 202, last_response.status
  end

  def test_response_message
    post "/"
    assert_equal "Message received.", last_response.body
  end
end


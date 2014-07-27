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

  def test_get_root
    get "/"
    assert_equal "Up.", last_response.body
  end

  def test_response_code
    post "/"
    assert_equal 202, last_response.status
  end

  def test_response_message
    post "/"
    assert_equal "Message received. id: ", last_response.body
  end

  def test_post_json
    post "/", { id: "1234", name: "Foo Bar" }.to_json
    assert_equal "Message received. id: 1234", last_response.body
  end
end


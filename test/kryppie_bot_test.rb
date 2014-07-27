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
    assert_match(/text\/plain/, last_response.headers["Content-Type"])
    assert_equal "Up.", last_response.body
  end

  def test_response_code
    post "/"
    assert_equal 202, last_response.status
  end

  def test_response_content_type
    post "/"
    assert_match(/text\/plain/, last_response.headers["Content-Type"])
  end

  def test_post_json
    post "/", "{ \"id\": \"1234\", \"name\": \"Foo Bar\" }"
    assert_equal "Message received.", last_response.body
  end
end


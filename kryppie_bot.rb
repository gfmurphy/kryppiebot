require "json"
require "logger"
require "sinatra"

enable :logging

before do
  logger.level = Logger.const_get ENV["LOG_LEVEL"] || "DEBUG"
end

get "/" do
  "Up."
end

post "/" do
  status 202
  content_type :json

  data = parse_request_body
  logger.debug(data.inspect)

  "Message received. id: %s" % data['id']
end

def parse_request_body
  if env["rack.input"].size > 0
    JSON.parse(env['rack.input'].gets)
  else
    {}
  end
end

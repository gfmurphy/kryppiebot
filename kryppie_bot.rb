require "sinatra"
require "logger"

enable :logging

before do
  logger.level = Logger.const_get ENV["LOG_LEVEL"] || "DEBUG"
end

get "/" do
  "Up."
end

post "/" do
  status 202
  logger.debug(request.inspect)
  "Message received."
end

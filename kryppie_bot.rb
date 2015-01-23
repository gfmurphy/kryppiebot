require "redis"
require "sinatra"

configure do
  set :public_folder, Proc.new { File.join(root, "public") }
  default_redis_url = "redis://localhost"
  uri = URI(ENV["REDISTOGO_URL"] || default_redis_url)
  REDIS = Redis.new(url: uri.to_s)
end

get "/" do
  content_type :text
  "Up."
end

post "/" do
  status 202
  content_type :text
  publish_message
  "Message received."
end

def publish_message
  if env["rack.input"].size > 0
    REDIS.publish "groupme:message", env["rack.input"].gets 
  end
end

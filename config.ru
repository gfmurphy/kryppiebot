require "rubygems"
require "bundler"

Bundler.require

$stdout.sync = true

$:.unshift(File.dirname(__FILE__))
require "kryppie_bot"
run Sinatra::Application

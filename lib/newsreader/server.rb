require 'sinatra/base'

module Newsreader
  class Server < Sinatra::Application
    get '/' do
      binding.pry
      Newsreader.channels.first.feeds.first.content
    end
  end
end
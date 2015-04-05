require 'sinatra/base'

module Newsreader
  class Server < Sinatra::Application
    get '/' do
      Newsreader.channels.first.feeds.first.content.items.first.title
    end
  end
end
require 'sinatra/base'

module Newsreader
  module Server
    class Anchorman < Sinatra::Application

      get '/' do
        erb :home, locals: { channels: Newsreader.channels }
      end

      get '/reload' do
        Newsreader.reload!
        redirect '/'
      end

    end
  end
end
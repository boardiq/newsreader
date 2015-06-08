require 'sinatra/base'

module Newsreader
  module Server
    class Anchorman < Sinatra::Application

      helpers do
        def truncate(text, length, end_string = ' ...')
          words = text.split()
          words = words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
        end
      end

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
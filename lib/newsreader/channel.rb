module Newsreader
  class Channel

    attr_reader :name, :catagories
    def initialize(name, catagories)
      @name       = name
      @catagories = catagories
    end

    def feeds
      @feeds ||= catagories.map { |k, v| Newsreader::Feed.new(k, v) }
    end

  end
end
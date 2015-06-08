module Newsreader
  class Feed

    attr_reader :name, :url
    def initialize(name, url)
      @name = name
      @url  = URI.parse(url)
    end

    def content
      @content ||= begin
        RSS::Parser.parse(feed, false)
      rescue
      end
    end

    private

      def feed
        @feed = Net::HTTP.get(url)
      end

  end
end
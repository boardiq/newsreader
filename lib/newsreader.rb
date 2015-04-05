require 'yaml'
require 'net/http'
require 'rss'
require 'active_support'
require 'active_support/core_ext'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require "newsreader/version"
require "newsreader/feed"
require "newsreader/channel"
require "newsreader/server"

module Newsreader
  
  module_function

  def config
    @config ||= {
      feeds: File.join(root, 'config', 'sites.yml')
    }
  end

  def reload!
    @feeds = nil
    @channels = nil
  end

  def feeds
    @feeds ||= YAML.load_file(config[:feeds]).with_indifferent_access
  end

  def channels
    @channels ||= feeds.map {|k,v| Newsreader::Channel.new(k, v)}
  end

  def root
    File.join File.expand_path(File.dirname(__FILE__)), '..'
  end

end

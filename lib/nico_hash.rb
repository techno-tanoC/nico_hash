# coding: utf-8

require "nico_hash/version"
Dir["#{File.dirname(__FILE__)}/nico_hash/*.rb"].sort.each do |path|
  require "nico_hash/#{File.basename(path, '.rb')}"
end

module NicoHash
  module Nico
    REGEX = /(http:\/\/www\.nicovideo\.jp\/watch\/)?((sm|nm)(\d+))/
    def extract_id(url)
      if url =~ REGEX then $2 else raise "invalid url" end
    end

    def constract(str)
      url = "http://www.nicovideo.jp/watch/"
      if str =~ REGEX then url + $2 else raise "invalid str" end
    end
  end

  extend Nico
  extend NicoHash::Mylist
end

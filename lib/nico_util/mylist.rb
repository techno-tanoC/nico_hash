# coding: utf-8

require 'open-uri'
require 'rexml/document'
require 'lambda_driver'

module NicoUtil::Mylist
  URL = /(http:\/\/www\.nicovideo\.jp\/mylist\/)?(\d+)(\?rss=2\.0)?/
  def resolve group_id
    builder = method(:build_url) >> method(:open) >> :read >> REXML::Document._.new >> (:get_elements & "rss/channel") >> :first

    doc =
      if URL =~ group_id
        builder < $2
      else
        raise "not mylist url or unexist mylist"
      end

    hash = meta(doc)
    hash[:items] = item(doc)
    hash
  end

  private
  def build_url mylist_id
    "http://www.nicovideo.jp/mylist/#{mylist_id}?rss=2.0"
  end

  def meta doc
    buff = [:title, :link, :description,
     :pubDate, :lastBuildDate].map {|sym|
      [sym, :to_s >> doc._.text < sym || ""]
    }.to_h

    buff[:creator] = doc._.text < "dc:creator" || ""
    buff
  end

  def item doc
    doc.get_elements("item").map do |item|
      [:title, :link, :pubDate, :description].map {|sym|
        [sym, :to_s >> item._.text < sym || ""]
      }.to_h
    end
  end
end

# coding: utf-8

module NicoHash::ThumbInfo
  THUMB = "http://ext.nicovideo.jp/api/getthumbinfo/"
  ID_REGEX = /^((sm|nm)(\d+))$/

  def thumb_info_resolve str
  end

  private
  include NicoHash::AttrSetter
end

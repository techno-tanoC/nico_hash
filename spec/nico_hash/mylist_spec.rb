# coding: utf-8

require 'spec_helper'

ok_xml = open("spec/files/ok.xml").read

describe NicoHash::Mylist do
  context "when valid xml" do
    subject(:mylist) { NicoHash.resolve_mylist(ok_xml) }

    it "have meta datas" do
      expect(mylist[:title]).to be_kind_of(String)
      expect(mylist[:link]).to be_kind_of(String)
      expect(mylist[:description]).to be_kind_of(String)
      expect(mylist[:creator]).to be_kind_of(String)
    end

    it "have items" do
      expect(mylist[:items]).to have(18).items
    end
  end
end

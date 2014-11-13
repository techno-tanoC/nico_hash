# coding: utf-8

require 'spec_helper'

describe NicoHash do
  describe "::extract_id" do
    context "when valid" do
      it "does not raise exception" do
        expect { subject.extract_id("sm123") }.to_not raise_error
        expect { subject.extract_id("http://www.nicovideo.jp/watch/sm123") }.to_not raise_error
      end

      it "returns video id" do
        expect(subject.extract_id("http://www.nicovideo.jp/watch/sm123")).to eq "sm123"
      end
    end

    context "when invalid" do
      it "raise exception" do
        expect { subject.extract_id("piyo") }.to raise_error
      end
    end
  end

  describe "::constract" do
    context "when valid" do
      it "does not raise exception" do
        expect { subject.constract("sm123") }.to_not raise_error
        expect { subject.constract("http://www.nicovideo.jp/watch/sm123") }.to_not raise_error
      end

      it "returns full url" do
        expect(subject.constract("sm123")).to eq "http://www.nicovideo.jp/watch/sm123"
      end
    end

    context "when invalid" do
      it "raise exception" do
        expect { subject.extract_id("piyo") }.to raise_error
      end
    end
  end
end

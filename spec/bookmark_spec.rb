require 'Bookmark'

describe Bookmark do
  describe ".all" do
    it "returns bookmark list" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("www.google.com")
      expect(bookmarks).to include("www.bbc.com")
    end
  end
end
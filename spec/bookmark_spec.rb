require 'Bookmark'

describe Bookmark do
  describe ".all" do
    it "returns bookmark list" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end
end
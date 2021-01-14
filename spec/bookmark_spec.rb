require 'Bookmark'

describe Bookmark do
  describe ".all" do
    it "returns bookmark list" do
      # Connect to the testing database
      connection = PG.connect( dbname: 'bookmark_manager_test' )
      # Add test data
      connection.exec( "INSERT INTO bookmarks (url) VALUES('http://www.google.com');" )
      connection.exec( "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');" )

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end
end
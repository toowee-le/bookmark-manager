require 'Bookmark'

describe Bookmark do
  describe ".all" do
    it "returns bookmark list" do
      # Connect to the testing database
      connection = PG.connect( dbname: 'bookmark_manager_test' )
      # Add test data
      connection.exec( "INSERT INTO bookmarks (name, url) VALUES('Google', 'http://www.google.com');" )
      connection.exec( "INSERT INTO bookmarks (name, url) VALUES('Makers Academy', 'http://www.makersacademy.com');" )

      bookmarks = Bookmark.all

      expect(bookmarks).to include(name: "Google", url: "http://www.google.com")
      expect(bookmarks).to include(name: "Makers Academy", url: "http://www.makersacademy.com")
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(name: "Google", url: "http//www.google.com")

      bookmarks = Bookmark.all

      # expect(bookmark.name).to eq "Google"
      # expect(bookmark.url).to eq "http://www.google.com"
      expect(bookmarks).to include(name: "Google", url:"http://www.google.com")
    end
  end
end
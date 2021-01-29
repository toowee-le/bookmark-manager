require 'Bookmark'
require 'database_helpers.rb'

describe Bookmark do
  describe ".all" do
    it "returns bookmark list" do
      # Connect to the test database
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add test data
      bookmark = Bookmark.create(name: "Google", url: "http://www.google.com")
      Bookmark.create(name: "Makers Academy", url: "http://www.makersacademy.com")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.name).to eq "Google"
      expect(bookmarks.first.url).to eq "http://www.google.com"
    end 
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(name: "Google", url: "http://www.google.com")
      persisted_data = persisted_data(id: bookmark.id)
   
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.name).to eq "Google"
      expect(bookmark.url).to eq "http://www.google.com"
    end
  end
end
require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    
    data = connection.exec( 'SELECT * FROM bookmarks' )
    # Return the site name and url only
    data.map do |hash|
      hash.select do |key, value|
        ["name", "url"].include? key
      end
    end
  end
end
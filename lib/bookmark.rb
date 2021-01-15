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
      { name: hash["name"], url: hash["url"]}
    end
  end

  def self.create(name:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end

    connection.exec( "INSERT INTO bookmarks (name, url) VALUES('#{name}', '#{url}') RETURNING name, url;" )
  end
end
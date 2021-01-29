require 'pg'

class Bookmark

  attr_reader :id, :name, :url

  def initialize(id:, name:, url:)
    @id = id
    @name = name
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    
    data = connection.exec("SELECT * FROM bookmarks")
    data.map do |hash|
      Bookmark.new(id: hash['id'], name: hash['name'], url: hash['url'])
    end
  end

  def self.create(name:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end

    result = connection.exec( "INSERT INTO bookmarks (name, url) VALUES('#{name}', '#{url}') RETURNING id, name, url" )
    Bookmark.new(id: result[0]['id'], name: result[0]['name'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end

    connection.exec("DELETE FROM bookmarks WHERE id = #{id};")

  end
end
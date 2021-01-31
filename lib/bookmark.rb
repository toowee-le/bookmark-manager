require 'pg'
require 'database_connection'

class Bookmark

  attr_reader :id, :name, :url

  def initialize(id:, name:, url:)
    @id = id
    @name = name
    @url = url
  end

  def self.all
    data = DatabaseConnection.query("SELECT * FROM bookmarks;")
    data.map do |hash|
      Bookmark.new(
        id: hash['id'], 
        name: hash['name'], 
        url: hash['url']
      )
    end
  end

  def self.create(name:, url:)
    data = DatabaseConnection.query("INSERT INTO bookmarks (name, url) VALUES('#{name}', '#{url}') RETURNING id, name, url;")
    Bookmark.new(
      id: data[0]['id'], 
      name: data[0]['name'], 
      url: data[0]['url']
    )
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update(id:, name:, url:)
    data = DatabaseConnection.query("UPDATE bookmarks SET name = '#{name}', url = '#{url}' WHERE id = '#{id}' RETURNING id, name, url;")
    Bookmark.new(
      id: data[0]['id'], 
      name: data[0]['name'], 
      url: data[0]['url']
    )
  end

  def self.find(id:)
    data = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(
      id: data[0]['id'], 
      name: data[0]['name'], 
      url: data[0]['url']
    )
  end
end
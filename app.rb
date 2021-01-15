require "sinatra/base"
require "./lib/bookmark"

class BookmarkManager < Sinatra::Base
  get "/" do
    "Hello world"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :'bookmarks'
  end

  get "/bookmarks/new" do
    erb :'bookmarks/new'
  end

  post "/bookmarks" do
    Bookmark.create(name: params['site_name'], url: params['site_url'])
    redirect :'bookmarks'
  end

  run! if app_file == $0
end
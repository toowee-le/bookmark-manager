require "sinatra/base"

class BookmarkManager < Sinatra::Base
  get "/" do
    "Hello world"
  end

  get "/bookmarks" do
    bookmarks = ["www.google.com", "www.bbc.com"]
  end

  run! if app_file == $0
end
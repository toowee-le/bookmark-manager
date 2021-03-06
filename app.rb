require "sinatra/base"
require "./lib/bookmark"
require "./lib/database_connection_setup"

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get "/" do
    "Hello world"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :'/bookmarks'
  end

  get "/bookmarks/new" do
    erb :'/bookmarks/new'
  end

  post "/bookmarks" do
    Bookmark.create(name: params[:site_name], url: params[:site_url])
    redirect :'/bookmarks'
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(id: params[:id])
    redirect :"/bookmarks"
  end

  patch "/bookmarks/:id" do
    Bookmark.update(id: params[:id], name: params[:site_name], url: params[:site_url])
    redirect :"/bookmarks"
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"/bookmarks/edit"
  end
  run! if app_file == $0
end
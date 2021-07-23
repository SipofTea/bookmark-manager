require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  get '/bookmarks/new' do
    erb(:add_bookmark)
  end

  post '/add_bookmark' do
    Bookmark.create(params[:bookmark_name], params[:bookmark])
    redirect to('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect to('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    @id = params[:id]
    erb(:edit_bookmark)
  end

  patch '/bookmarks/:id' do
    bookmark = Bookmark.find(params[:id])
    Bookmark.update(bookmark.id, params[:bookmark_name], params[:bookmark])
    redirect to('/bookmarks')
  end

  run! if app_file == $0
end

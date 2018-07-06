require 'sinatra/base'
require './models/bookmark'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
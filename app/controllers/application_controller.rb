
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts/new' do
  erb :new
  end

  post '/posts' do
  @post = Posts.create(name: params[:name], content: params[:content])
    redirects to '/posts'
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
  erb :edit
  end

  patch '/posts/:id' do
    Post.find(id: params[:id]).update(name: params[:name], content: params[:content])
        redirect to '/posts/:id'
  end

end

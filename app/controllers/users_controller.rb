class UsersController < ApplicationController
  get '/' do
    redirect_if_logged_in
    erb :'users/home'
  end

  post '/login' do
  end

  get '/logout' do
  end

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
  end

end

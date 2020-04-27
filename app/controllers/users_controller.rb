class UsersController < ApplicationController
  get '/users/new' do
    erb :"users/new"
  end

  get '/users/home' do
    erb :"users/home"
  end
end

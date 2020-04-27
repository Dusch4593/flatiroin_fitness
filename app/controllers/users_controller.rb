class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/users'
    else
      redirect '/users/new'
    end
  end

  get '/users' do
    erb :"users/index"
  end


end

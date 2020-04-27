class SessionsController < ApplicationController
  get '/login' do
    erb :"sessions/login"
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @session = session
      redirect to('/users/home')
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/login'
  end

  get '/signup' do
    erb :"users/new"
  end

  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])

    if(@user.save)
      session[:user_id] = @user.id
      redirect '/users'
    else
      erb :"users/new"
    end
  end
end

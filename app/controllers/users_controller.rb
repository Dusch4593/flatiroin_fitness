class UsersController < ApplicationController
  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])

    if(@user.save)
      session[:user_id] = @user.id
      redirect '/routines'
    else
      erb :'users/new'
    end
  end

end

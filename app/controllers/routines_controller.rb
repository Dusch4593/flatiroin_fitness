class RoutinesController < ApplicationController
  get '/routines' do
    if is_logged_in?
      @routines = current_user.routines.all
      erb :"routines/index"
    else
      erb :"sessions/error"
    end
  end

  get '/routines/new' do
    @users = User.all
    erb :"routines/new"
  end

  post '/routines' do
    @routine = current_user.routines.build(name: params[:name], times_per_week: params[:times_per_week])
    if @routine.save
      redirect '/routines' # redirect '/routines/#{routine.id}'
    else
      erb :"routines/new"
    end
  end

  get '/routines/:id' do
    @routine = Routine.find_by(params[:id])
    if @routine.user_id == current_user.id
      erb :"routines/show"
    else
      redirect '/routines'
    end
  end

  get '/routines/:id/edit' do
    @routine = Routine.find_by(params[:id])
    if @routine.user_id == current_user.id
      erb :"routines/edit"
    else
      redirect '/routines'
    end
  end

  patch '/routines/:id' do
    @routine = Routine.find_by(params[:id])
    params.delete("_method")
    if @routine.user_id == current_user.id && @routine.update(name: params[:name], times_per_week: params[:times_per_week])
      redirect "/routines/#{@routine.id}"
    else
      redirect '/routines'
    end
  end

  delete '/routines/:id' do
    @routine = Routine.find_by(params[:id])
    if @routine.user_id == current_user.id
      @routine.delete
      redirect '/routines'
    else
      redirect '/routines'
    end
  end
end

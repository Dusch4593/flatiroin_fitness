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
    @exercises = current_user.exercises
    erb :"routines/new"
  end

  post '/routines' do
    @routine = Routine.new
    @routine[:name] = params[:name]
    @routine[:times_per_week] = params[:times_per_week]
    if @routine.save && !params[:exercises].first[:name].empty?
      current_user.routines << @routine
      params[:exercises].each do |details|
        @exercise = Exercise.new(details)
        @exercise[:routine_id] = @routine.id
        @exercise.save
        current_user.exercises << @exercise
      end
      redirect '/routines' # redirect '/routines/#{routine.id}'
    else
      erb :"routines/new"
    end
  end

  get '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
    @exercises = @routine.exercises
    if @routine.user_id == current_user.id
      erb :"routines/show"
    else
      redirect '/routines'
    end
  end

  get '/routines/:id/edit' do
    @routine = Routine.find_by_id(params[:id])
    if @routine.user_id == current_user.id
      erb :"routines/edit"
    else
      redirect '/routines'
    end
  end

  patch '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
    params.delete("_method")
    binding.pry
    if @routine.user_id == current_user.id && @routine.update(name: params[:name], times_per_week: params[:times_per_week])
      redirect "/routines/#{@routine.id}"
    else
      redirect '/routines'
    end
  end

  delete '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
    if @routine.user_id == current_user.id
      @routine.delete
      redirect '/routines'
    else
      redirect '/routines'
    end
  end
end

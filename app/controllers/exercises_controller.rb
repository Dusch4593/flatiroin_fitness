class ExercisesController < ApplicationController

  get 'exercises/:id' do
    binding.pry
    erb :"exercises/show"
  end

  get '/exercises/:id/edit' do
    @exercise = Exercise.find_by_id(params[:id])
    if @exercise.user_id == current_user.id
      erb :"exercises/edit"
    else
      redirect '/routines'
    end
  end

  patch '/exercises/:id' do
    @routine = Routine.find_by_id(params[:id])
    params.delete("_method")
    if @routine.user_id == current_user.id && @routine.update(name: params[:name], times_per_week: params[:times_per_week])
      redirect "/exercises/#{@routine.id}"
    else
      redirect '/routines'
    end
  end

  delete '/exercises/:id' do
    @routine = Routine.find_by_id(params[:id])
    if @routine.user_id == current_user.id
      @routine.delete
      redirect '/routines'
    else
      redirect '/routines'
    end
  end
end

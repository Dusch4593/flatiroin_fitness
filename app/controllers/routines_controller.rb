class RoutinesController < ApplicationController
  get '/routines' do
    #binding.pry
    
    erb :'routines/show'
  end
end

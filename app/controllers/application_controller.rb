require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end

  get '/' do
    erb :welcome
  end

  helpers do
    def is_logged_in?
      session[:user_id] ? true : false
    end

    def current_user
      @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
    end
  end
end

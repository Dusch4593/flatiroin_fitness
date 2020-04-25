require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end

  helpers do
    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !is_logged_in?
        redirect to '/'
      end
    end

    def redirect_if_logged_in
      if is_logged_in?
        redirect to '/routines'
      end
    end
  end
end

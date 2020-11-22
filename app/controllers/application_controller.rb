
class ApplicationController < Sinatra::Base
  LOGIN_MESSAGE = "You must be logged in to visit that page"
  BOAT_TYPES = ["Colgate", "Rhodes", "Ideal", "Cruiser"]
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "3799854cc3b550e3e49c"
  end
  register Sinatra::Flash

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
    
    def allowed_page
      request.path == "/login" || request.path == "/signup" || request.path == "/"
    end

    def secure_page
      if !logged_in?
        flash.next[:message] = LOGIN_MESSAGE
        redirect '/login'
      end
    end

    def has_access?
      current_user.id == params[:id].to_i
    end

    def format_date(date)
      date.strftime("%d/%m/%y")
    end

    def format_date_time(date)
      date.strftime("%d/%m/%y %H:%M")
    end
  end

end

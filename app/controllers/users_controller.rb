class UsersController < ApplicationController
  
  get '/users' do
    secure_page
    @users = User.all
    erb :'users/index'
  end
  
  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect "/"
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    if params[:user][:username] == "" || params[:user][:password] == ""
      flash.next[:message] = "You must enter a username and a password"
      redirect '/login'
    else 
      user = User.find_by_username(params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect '/'
      else
        redirect '/signup'
      end
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users/:id' do
    secure_page
    @user = User.find_by_id(params[:id])
    @boats_array = @user.tasks.map {|task| task.sailboat}.uniq
    erb :'users/show'
  end

  get "/users/:id/edit" do
    secure_page
    @user = User.find(params[:id])
    erb :"/users/edit"
  end

  patch "/users/:id" do
    secure_page
    user = User.find(params[:id])
    user.update(params[:user])
    redirect "/users/#{user.id}"
  end

  post "/users/:id/delete" do
    secure_page
    user = User.find(params[:id])
    user.destroy
    redirect "/users"
  end
end
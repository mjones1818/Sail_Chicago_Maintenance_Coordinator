class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    secure_page
    @tasks = Task.all
    erb :"/tasks/index.html"
  end

  # GET: /tasks/new
  get "/tasks/new" do
    secure_page
    @tasks = Task.all
    @users = User.all
    @parts = Part.all
    @task_names = []
    @tasks.each {|task| @task_names << task.name}
    @sailboats = Sailboat.all
    @boat_types = @sailboats.map {|sailboat| sailboat.boat_type}.uniq
    erb :"/tasks/new.html"
  end

  # POST: /tasks
  post "/tasks" do
    secure_page
    task_hash = params[:task].reject {|key, value| key == "user" || value == "" || key == "parts"}
    task = Task.create(task_hash)
    params[:task][:user].each {|user_id| task.users << User.find(user_id)}
    params[:task][:parts].each {|part_id| task.parts << Part.find(part_id)}
    task.save
    redirect "/tasks"
  end

  # GET: /tasks/5
  get "/tasks/:id" do
    secure_page
    @task = Task.find_by_id(params[:id])
    erb :"/tasks/show.html"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    secure_page
    @users = User.all
    @task =Task.find(params[:id])
    @sailboats = Sailboat.all
    @boat_types = @sailboats.map {|sailboat| sailboat.boat_type}.uniq
    erb :"/tasks/edit.html"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    secure_page
    task = Task.find(params[:id])
    task_hash = params[:task].reject {|key, value| key == "user" || value == ""}
    task.update(task_hash)
    task.users.clear
    params[:task][:user].each {|user_id| task.users << User.find(user_id)}
    redirect "/tasks/#{task.id}"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id/delete" do
    secure_page
    task = Task.find(params[:id])
    task.destroy
    redirect "/tasks"
  end
end

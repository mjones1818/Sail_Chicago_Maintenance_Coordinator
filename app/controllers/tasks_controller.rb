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
    validate_data
    task_hash = params[:task].reject {|key, value| key == "user" || value == "" || key == "parts"}
    task = Task.create(task_hash)
    params[:task][:user].each {|user_id| task.users << User.find(user_id)}
    if params[:task].key?(:parts)
      params[:task][:parts].each {|part_id| task.parts << Part.find(part_id)}
    end 
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
    @parts = Part.all
    @boat_types = @sailboats.map {|sailboat| sailboat.boat_type}.uniq
    erb :"/tasks/edit.html"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    secure_page
    task = Task.find(params[:id])
    task_hash = params[:task].reject {|key, value| key == "user" || value == "" || key == "parts"}
    task.update(task_hash)
    task.users.clear
    params[:task][:user].each {|user_id| task.users << User.find(user_id)}
    if params[:task].key?(:parts)
      task.parts.clear
      params[:task][:parts].each {|part_id| task.parts << Part.find(part_id)}
    end 
    redirect "/tasks/#{task.id}"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id/delete" do
    secure_page
    task = Task.find(params[:id])
    task.destroy
    redirect "/tasks"
  end

  private

  def validate_data
    if params[:task][:date_completed]== "" && params[:task][:date_due] == ""
      flash.next[:message] = "You must enter enter a date"
      redirect '/tasks/new'
    elsif !params[:task].key?(:user)
      flash.next[:message] = "You must select at least one user"
      redirect '/tasks/new'
    elsif params[:task][:date_completed] != "" && params[:task][:date_due] != ""
      flash.next[:message] = "You can not enter a due date and a date completed. Please enter one or the other"
      redirect '/tasks/new'
    elsif params[:task][:name]== ""
      flash.next[:message] = "You must enter a name"
      redirect '/tasks/new'
    end
  end

end

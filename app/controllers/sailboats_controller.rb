class SailboatsController < ApplicationController
  before do 
    secure_page
  end


  # GET: /sailboats
  get "/sailboats" do
    @sailboats = Sailboat.all
    erb :"/sailboats/index.html"
  end

  # GET: /sailboats/new
  get "/sailboats/new" do
    @sailboats = Sailboat.all
    erb :"/sailboats/new.html"
  end

  # POST: /sailboats
  post "/sailboats" do
    validate_data
    Sailboat.create(params[:sailboat])
    redirect "/sailboats"
  end

  # GET: /sailboats/5
  get "/sailboats/:id" do
    @sailboat = Sailboat.find_by_id(params[:id])
    erb :"/sailboats/show.html"
  end

  # GET: /sailboats/5/edit
  get "/sailboats/:id/edit" do
    @sailboat = Sailboat.find(params[:id])
    sailboats = Sailboat.all
    @boat_types = []
    sailboats.each {|sailboat| @boat_types << sailboat.boat_type}
    erb :"/sailboats/edit.html"
  end

  # PATCH: /sailboats/5
  patch "/sailboats/:id" do
    sailboat = Sailboat.find(params[:id])
    sailboat.update(params[:sailboat])
    redirect "/sailboats/#{sailboat.id}"
  end

  # DELETE: /sailboats/5/delete
  post "/sailboats/:id/delete" do
    sailboat = Sailboat.find(params[:id])
    sailboat.destroy
    redirect "/sailboats"
  end

  private

  def validate_data
    if params[:sailboat][:name]== "" || !params[:sailboat].key?(:boat_type)
      flash.next[:message] = "You must enter enter a name and select a boat type"
      redirect '/sailboats/new'
    end
  end
end

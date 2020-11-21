class PartsController < ApplicationController

  # GET: /parts
  get "/parts" do
    secure_page
    @parts = Part.all
    erb :"/parts/index.html"
  end

  # GET: /parts/new
  get "/parts/new" do
    secure_page
    erb :"/parts/new.html"
  end

  # POST: /parts
  post "/parts" do
    secure_page
    validate_data
    part = Part.create(params[:part])
    redirect "/parts/#{part.id}"
  end

  # GET: /parts/5
  get "/parts/:id" do
    secure_page
    @part = Part.find(params[:id])
    erb :"/parts/show.html"
  end

  # GET: /parts/5/edit
  get "/parts/:id/edit" do
    secure_page
    @part = Part.find(params[:id])
    erb :"/parts/edit.html"
  end

  # PATCH: /parts/5
  patch "/parts/:id" do
    secure_page
    part = Part.find(params[:id])
    part.update(params[:part])
    redirect "/parts/#{part.id}"
  end

  # DELETE: /parts/5/delete
  delete "/parts/:id/delete" do
    secure_page
    part = Part.find(params[:id])
    part.destroy
    redirect "/parts"
  end

  private

  def validate_data
    if params[:part][:name]== ""
      flash.next[:message] = "You must enter enter a part name"
      redirect '/parts/new'
    end
  end
end

class PartsController < ApplicationController

  # GET: /parts
  get "/parts" do
    @parts = Part.all
    erb :"/parts/index.html"
  end

  # GET: /parts/new
  get "/parts/new" do
    erb :"/parts/new.html"
  end

  # POST: /parts
  post "/parts" do
    part = Part.create(params[:part])
    redirect "/parts/#{part.id}"
  end

  # GET: /parts/5
  get "/parts/:id" do
    @part = Part.find(params[:id])
    erb :"/parts/show.html"
  end

  # GET: /parts/5/edit
  get "/parts/:id/edit" do
    @part = Part.find(params[:id])
    erb :"/parts/edit.html"
  end

  # PATCH: /parts/5
  patch "/parts/:id" do
    part = Part.find(params[:id])
    part.update(params[:part])
    redirect "/parts/#{part.id}"
  end

  # DELETE: /parts/5/delete
  delete "/parts/:id/delete" do
    part = Part.find(params[:id])
    part.destroy
    redirect "/parts"
  end
end

class PhotosController < ApplicationController
  respond_to :html, :js

  def index
    respond_with @photos = Photo.all
  end

  def show
    respond_with @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.save
    render :action => 'create.js.erb'
  end
end

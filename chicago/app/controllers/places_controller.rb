class PlacesController < ApplicationController

  def index
    @places = Place.order('title asc')
  end

  def show
    @place = Place.find_by(id: params[:id])
    @reviews = Review.order('id desc').where(place_id: @place.id)
    if @place == nil
      redirect_to places_url, notice: "Place not found"
    end
  end

  def new

  end
  
  def create
    place = Place.new
    place.title = params[:title]
    place.price = (params[:price].to_f * 100).to_i
    place.photo_url = params[:photo_url]
    place.desc = params[:desc]
    place.save
    redirect_to places_url
  end

  def edit
    @place = Place.find_by(id: params[:id])
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.title = params[:title]
    @place.price = (params[:price].to_f * 100).to_i
    @place.photo_url = params[:photo_url]
    @place.desc = params[:desc]
    @place.save
    redirect_to place_url(params[:id])
  end

  def destroy
    @place = Place.find_by(id: params[:id])
    @place.delete
    redirect_to places_url
  end

end

class ReviewsController < ApplicationController

  def create
    r = Review.new
    r.place_id = params[:place_id]
    r.rating = params[:rating]
    r.desc = params[:desc]
    r.save
    redirect_to place_url(params[:place_id])
  end

end

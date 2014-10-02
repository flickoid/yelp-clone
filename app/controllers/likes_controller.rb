class LikesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    @review = Review.find(params[:review_id])
    @review.likes.create
    render json: { new_like_count: "#{pluralize(@review.likes.count, "like")}"}
  end
end

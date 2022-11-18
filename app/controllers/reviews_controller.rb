class ReviewsController < ApplicationController
  before_action :set_bookmark, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.bookmark = @bookmark
    if @review.save
      redirect_to list_path(@bookmark.list_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def review_params
    params.require(:review).permit(:bookmark_id, :content, :rating)
  end
end

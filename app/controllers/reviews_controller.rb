class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render "lists/show", locals: {list: @list, bookmark: @bookmark, review: @review},status: :unprocessable_entity
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

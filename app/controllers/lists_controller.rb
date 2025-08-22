class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @reviews = @list.reviews
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      # No need for a create view
      redirect_to list_path(@list), notice: "List was successfully created"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

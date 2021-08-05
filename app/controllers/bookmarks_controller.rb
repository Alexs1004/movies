class BookmarksController < ApplicationController
  def new
    @list = List.find(params(:list_id))
    @bookmark = Bookmark.new 
  end

  def create
    @list = List.find(params(:list_id))
    @bookmark = Bookmark.new(bookmark_params)
    @
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render "new"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to '/bookmarks/new', :notice => "Your bookmark has been deleted"
  end
  
  
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

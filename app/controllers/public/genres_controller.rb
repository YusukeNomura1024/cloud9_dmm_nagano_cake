class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @items = Item.where(is_active: true, genre: @genre.id).page(params[:page])
    @list_title = @genre.name
    render 'public/items/index'
  end

end

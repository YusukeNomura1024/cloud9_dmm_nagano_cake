class Public::ItemsController < ApplicationController

  #必ずis_activeがtrueの商品だけ表示されるようにしてください
  def index
    @genres = Genre.all
    @items = Item.where(is_active: true).page(params[:page])
    @list_title = "商品"
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    @genres = Genre.all
    @items = Item.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    @list_title = @keyword + " の検索結果 "
    render 'public/items/index'
  end


end

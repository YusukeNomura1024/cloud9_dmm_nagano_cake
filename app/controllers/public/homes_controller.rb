class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @new_items = Item.all.order(created_at: "DESC").limit(4)
  end

  def about
  end
end

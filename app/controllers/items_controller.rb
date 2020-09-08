class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    if current_user.id == user.user_id
      @item = Item.new
    else
      redirect_to root_path
  end

  def create
    Item.create(item_params)
  end
  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :prefecture_id, :sending_time_id, :price)
  end
    
    
end
end

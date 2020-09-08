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

  private
  def item_params
    params.require(:item).permit(:image, :text)
  end
    
    
end
end

class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]

  def index
    @items = Item.includes(:user).order(id: "DESC")
    # @items = Item.all.order(id: "DESC")
   
  end

  def new
    
    @item = Item.new
   
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
     
      redirect_to root_path
    else
      render :new
    end
   
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :postage_payer_id, :description, :category_id, :condition_id, :prefecture_id, :sending_time_id, :price).merge(user_id:current_user.id)
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end
    
    
end


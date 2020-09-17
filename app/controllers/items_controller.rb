class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:user).order(id: "DESC")
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

  def show  
 
  end

  def edit    
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    
   if @item.destroy
    redirect_to root_path
   else
    render :show
   end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :postage_payer_id, :description, :category_id,
     :condition_id, :prefecture_id, :sending_time_id, :price).merge(user_id:current_user.id)
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end


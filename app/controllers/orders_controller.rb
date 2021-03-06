class OrdersController < ApplicationController
 before_action :move_to_sign_in ,  only:[:index]
 before_action :move_to_root_path , only:[:index]
  def index 
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params) 
  end

  def create
    @order = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_root_path
    @item = Item.find(params[:item_id])
    if  current_user.id == @item.user_id || @item.order != nil  
      redirect_to root_path
    end
  end

  def move_to_sign_in 
    unless user_signed_in? 
      redirect_to  new_user_session_path
    end
  end

  def order_params
    params.permit( :zip_code, :prefecture_id,:city, :house_number, :building, :phone_number,:token, :authenticity_token)
    .merge(user_id:current_user.id,item_id:params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end

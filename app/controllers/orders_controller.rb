class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
  end

  #def order_params
    #params.require(:item_order).permit(:postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_nember).merge(token: params[:token])
  #end

end

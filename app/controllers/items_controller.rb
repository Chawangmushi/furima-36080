class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :destroy]


  def index
  end


  def new
    @item = Item.new

  end
  
  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end



  
  
  private
    def item_params
      params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :shipping_payment_id, :shipping_from_id, :shipping_day_id).merge(user_id: current_user.id)
    end

#def article_params
#  params.require(:article).permit(:title,:text,:genre_id)
#end

end

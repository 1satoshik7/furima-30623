class ItemsController < ApplicationController
  def index
    
  end

  def new

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :product_status_id, :price, :freight_id, :shiptoaddress_id, :shipdate_id, :image).merge(user_id: current_user.id)
  end
end

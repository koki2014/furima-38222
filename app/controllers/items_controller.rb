class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @item = Item.all.order(created_at: :desc)
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
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :charge_bearer_id, :shipping_area_id, :delivary_day_id, :price).merge(user_id: current_user.id)
  end

end

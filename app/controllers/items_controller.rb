class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]

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


  def edit
    if @item.order != nil
        redirect_to root_path
    end

  end

  def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
  end

  
  def destroy
    if @item.destroy
      redirect_to root_path
    end
   
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :charge_bearer_id, :shipping_area_id, :delivary_day_id, :price).merge(user_id: current_user.id)
  end

  def ensure_current_user
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

end

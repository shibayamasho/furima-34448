class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def item_params
    params.require(:item).permit(
      :item_name, :item_text,
      :category_id, :condition_id, :delivery_fee_id,
      :shipment_source_id, :days_to_ship_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end
end

class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    
  end
end

class OrdersController < ApplicationController

  def index
    @orders = Order.all.pluck :id
    render component: 'Orders', props: { orders: @orders }
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new
    order.save
    redirect_to order_path order.id
  end

  def show
    @order = Order.find(params[:id])
  end
end

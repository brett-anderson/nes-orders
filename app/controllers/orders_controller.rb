# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to order_path order.id
  end

  def show
    @order = Order.find(params[:id])
    @search_value = search_params
    @products = @search_value ? Product.search(@search_value) : Product.all
  end

  def update
    @order = Order.find(params[:id])
    @order.attributes = order_params
    flash[:success] = @order.submitted? ? 'Order Submitted' : 'Order Cancelled' if @order.status_changed?
    @order.save
    redirect_to action: :show, id: @order.id
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :id, :destroy_product_id, :customer_id, :status)
  end

  def search_params
    params.permit(:search)[:search]
  end
end

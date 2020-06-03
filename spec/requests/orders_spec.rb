# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let!(:orders) { FactoryBot.create_list(:order, 3) }
  let!(:products) { FactoryBot.create_list(:product, 10) }

  describe 'GET /orders' do
    it 'returns 200' do
      get orders_path
      expect(response).to have_http_status(200)
    end

    it 'returns orders in body' do
      get orders_path
      expect(response.body).to include(orders.first.customer.name)
    end
  end

  describe 'POST /orders' do
    let(:customer) { FactoryBot.create(:customer) }

    it 'returns 302' do
      post orders_path, params: { order: { customer_id: customer.id } }
      expect(response).to have_http_status(302)
    end

    it 'redirects to the show route' do
      post orders_path, params: { order: { customer_id: customer.id } }
      expect(response).to redirect_to order_path(Order.last.id)
      follow_redirect!
      expect(response.body).to include(customer.name)
    end
  end

  describe 'GET /orders/id' do
    it 'returns 200' do
      get orders_path(orders.first)
      expect(response).to have_http_status(200)
    end
    it 'displays products' do
      get order_path(orders.first)
      expect(response.body).to include(products.first.name)
    end
  end

  describe 'PATCH /orders' do
    let(:order) { FactoryBot.create(:order) }
    let(:product) { FactoryBot.create(:product) }
    it 'has 302 status' do
      patch order_path(order), params: { order: { status: :submitted } }
      expect(response).to have_http_status 302
    end
    it 'updates status' do
      patch order_path(order), params: { order: { status: :submitted } }
      expect(order.reload.status).to eq 'submitted'
    end

    it 'adds products' do
      patch order_path(order), params: { order: { product_id: product.id } }
      expect(order.reload.products.first).to eq(product)
    end

    it 'removes products' do
      order.products = [product]
      patch order_path(order), params: { order: { destroy_product_id: product.id } }
      expect(order.reload.products).to match_array []
    end
  end
end

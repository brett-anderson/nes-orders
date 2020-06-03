# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create(:order) }
  let(:products) { FactoryBot.build_list(:product, 2, cost: 5) }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:products) }
    it { is_expected.to belong_to(:customer) }
  end

  describe 'status' do
    it 'returns a status enum' do
      expect(Order.statuses).to eq({ draft: 0, submitted: 1, cancelled: 2 }.with_indifferent_access)
    end
  end

  describe 'taxes' do
    let(:order) { FactoryBot.build(:order) }
    let(:products) { FactoryBot.build_list(:product, 2, cost: 5) }

    describe 'pre_cost_tax' do
      it 'returns 0 with no products' do
        expect(order.pre_tax_cost).to equal 0
      end

      it 'returns the pre tax amount' do
        order.products = products
        expect(order.pre_tax_cost).to equal 10.0
      end
    end

    describe 'total_cost' do
      it 'returns 0 with no products' do
        expect(order.pre_tax_cost).to equal 0
      end
      it 'returns the cost with taxes' do
        order.products = products
        expect(order.total_cost).to equal 11.2
      end
    end

    describe 'pst' do
      it 'returns 0 with no products' do
        expect(order.pre_tax_cost).to equal 0
      end
      it 'returns the pst' do
        order.products = products
        expect(order.pst).to equal 0.7
      end
    end

    describe 'gst' do
      it 'returns 0 with no products' do
        expect(order.pre_tax_cost).to equal 0
      end
      it 'returns the gst' do
        order.products = products
        expect(order.gst).to equal 0.5
      end
    end
  end

  describe 'adding and removing products' do
    let(:product) { FactoryBot.create :product }
    describe 'product_id=' do
      it 'adds products' do
        order.product_id = product.id
        expect(order.reload.products.first).to eq product
      end
    end

    describe 'destroy_product_id' do
      it 'removes products' do
        order.product_id = product.id
        order.destroy_product_id = product.id
        expect(order.reload.products).to eq []
      end
    end
  end
end

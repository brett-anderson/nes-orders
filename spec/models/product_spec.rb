# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:orders) }
  end

  describe 'search' do
    let!(:product1) { FactoryBot.create(:product, name: 'mario') }
    let!(:product2) { FactoryBot.create(:product, name: 'luigi') }

    it 'returns products from a search' do
      products = Product.search('mario')

      expect(products).to match_array([product1])
    end
  end
end

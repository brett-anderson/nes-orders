# frozen_string_literal: true

class Order < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :customer
  validates :customer, presence: true

  enum status: {
    draft: 0,
    submitted: 1,
    cancelled: 2
  }

  def pre_tax_cost
    products.map { |product| product.cost.to_f }.inject(0) { |sum, x| sum + x }
  end

  def total_cost
    (pre_tax_cost + pst + gst).round(2)
  end

  def pst
    (pre_tax_cost * 0.07).round(2)
  end

  def gst
    (pre_tax_cost * 0.05).round(2)
  end

  def product_id=(product_id)
    products << Product.find(product_id)
  end

  def destroy_product_id=(product_id)
    products.destroy(product_id)
  end
end

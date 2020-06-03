# frozen_string_literal: true

class CreateOrdersProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_products, id: false do |t|
      t.timestamps
      t.belongs_to :product
      t.belongs_to :order
    end
  end
end

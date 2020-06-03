# frozen_string_literal: true

class AddCustomerToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :customer
  end
end

# frozen_string_literal: true

class AddImagePathToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_path, :string
  end
end

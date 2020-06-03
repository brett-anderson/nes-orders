# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :orders

  monetize :cost_cents

  scope :search, ->(value) { where('name ilike ?', "%#{value}%") }
end

# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    cost_cents { 100 }
    name { Faker::Beer.brand }
    image_path { '/' }
  end
end

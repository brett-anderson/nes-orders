# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
  { name: 'Super Mario Bros', image_path: 'super_mario_bros.jpg', cost_cents: 500 },
  { name: 'Super Mario Bros 2', image_path: 'super_mario_bros2.jpg', cost_cents: 500 },
  { name: 'Super Mario Bros 3', image_path: 'super_mario_bros3.jpg', cost_cents: 700 },
  { name: 'Castlevania', image_path: 'castlevania.jpg', cost_cents: 600 },
  { name: 'Donkey Kong', image_path: 'donkey_kong.jpg', cost_cents: 600 },
  { name: 'Final Fantasy', image_path: 'final_fantasy.jpg', cost_cents: 900 },
  { name: 'Kirby', image_path: 'kirby.jpg', cost_cents: 300 },
  { name: 'Megaman', image_path: 'megaman.jpg', cost_cents: 700 },
  { name: 'Metroid', image_path: 'metroid.jpg', cost_cents: 800 },
  { name: 'Ninja Gaiden', image_path: 'ninja_gaiden.jpg', cost_cents: 400 },
  { name: 'Pac Man', image_path: 'pac_man.jpg', cost_cents: 300 }
]

customers = %w[
  Richard
  Nelson
  Bertram 
  Dinesh 
  Monica 
  Jared
  Gavin 
  Jian 
  Laurie 
  Erlich 
]

customers.each { |customer| Customer.create! name: customer } unless Customer.count > 0
products.each { |product| Product.create! product } unless Product.count > 0



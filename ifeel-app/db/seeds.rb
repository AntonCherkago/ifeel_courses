# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.connection.execute("INSERT INTO users (first_name, last_name, age, created_at, updated_at) VALUES ('Anton', 'Konovalov', 18, '#{Time.current}', '#{Time.current}')")
ActiveRecord::Base.connection.execute("INSERT INTO items (name, price, store, created_at, updated_at) VALUES ('bananas', 30, 'Delikat', '#{Time.current}', '#{Time.current}')")

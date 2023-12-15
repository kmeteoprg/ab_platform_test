# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

AbTest.create!(title: "button_color", probabilities: [33.3, 33.3, 33.3], options: ["#FF0000", "#00FF00", "#0000FF"])
AbTest.create!(title: "price", probabilities: [75, 10, 5, 10], options: [10, 20, 50, 5])

1200.times { |i| Device.create!(token: "device_#{i+1}") }

Device.all.each { |device| Splitter.new(device).split }


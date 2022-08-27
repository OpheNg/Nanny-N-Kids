# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

print "recreating the seed"

nanny_1 = Nanny.create(last_name: "Paillon", first_name: "Joseline", address: "13 rue ici")
user_ulysse = User.create(email: "emailfactice@klh.fr", last_name: "Caillou", first_name: "Personne", address: "la street")


booking_1 = Booking.create(nanny_id: 1, user_id: 1, start_date: Date.today, end_date: Date.today, status: "?", total_price: 6.9)
booking_2 = Booking.create(nanny_id: 2, user_id: 2, start_date: Date.today, end_date: Date.today, status: "✅❤️", total_price: 300)


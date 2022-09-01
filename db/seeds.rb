# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

print "recreating the seed"

#<User id: 1, email: "1@1.fr", created_at: "2022-08-28 14:58:31.425650000 +0000", updated_at: "2022-08-28 14:58:31.425650000 +0000", last_name: nil, first_name: nil, address: nil, phone_number: nil>


user_1 = User.create(email: "1@1.fr", last_name: "DUPONT", first_name: "Jean", address: "3 rue des enfers", phone_number: "06.84.45.92.05")
user_2 = User.create(email: "2@2.fr", last_name: "BERN", first_name: "Stéphane", address: "8eme cercle des enfers", phone_number: "06.10.23.45.11")
user_3 = User.create(email: "3@3.fr", last_name: "SCHWARZNEGER", first_name: "Arnold", address: "Texas", phone_number: "06.64.10.49.33")


#<Nanny:0x0000563212474ab0 id: 1, last_name: "G", first_name: "Ulysse", address: nil, tel: "0607", email: nil, description: nil, experience: nil, capacity: nil, birthday: nil, kids_category: nil, sex: nil, at_user_place: nil, at_your_place: nil, price_per_day: 100, created_at: Sun, 28 Aug 2022 14:58:53.010476000 UTC +00:00, updated_at: Sun, 28 Aug 2022 14:58:53.010476000 UTC +00:00, user_id: 1>
nanny_1 = Nanny.create(last_name: "PAILLON", first_name: "Joseline", address: "13 rue ici", tel: "07.22.15.10.99", description: "Spécialiste dans la garde de jeune enfants", experience: 5, capacity: 1, sex: "femme", price_per_day: 50, user_id: 1)
nanny_2 = Nanny.create(last_name: "PEROND", first_name: "Jean", address: "15 rue des fleurs", tel: "07.30.19.01.10", description: "Homme mais nounou !", experience: 4, capacity: 3, sex: "homme", price_per_day: 40, user_id: 2)
nanny_3 = Nanny.create(last_name: "SURREAU", first_name: "Josiane", address: "73 bis rue des moulinots", tel: "07.51.10.08.75", description: "Nouvelle nourrice pour les grands et les petits", experience: 1, capacity: 1, sex: "femme", price_per_day: 10, user_id: 3)



booking_1 = Booking.create(nanny_id: 1, user_id: 1, start_date: Date.today - 6, end_date: Date.today - 1, status: "passed", total_price: 6.9)
booking_2 = Booking.create(nanny_id: 2, user_id: 2, start_date: Date.today + 1, end_date: Date.today + 3, status: "Next booking", total_price: 300)
booking_3 = Booking.create(nanny_id: 3, user_id: 3, start_date: Date.today + 1, end_date: Date.today + 3, status: "Next booking", total_price: 300)

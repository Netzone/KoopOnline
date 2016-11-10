# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
    email: 'koop@koop.se',
    password: 'admin123',
    address:'Vintergatan 7',
    city: 'Jönköping',
    password_confirmation: 'admin123'
)
user.skip_confirmation!
user.save!

Supplier.new({name:'Orkla Foods', email:'info@orklafoods.se', address:'Isbergs gata 9B', city:'Malmö', website:'orklafoods.se', phone:'010-142 42 42', user_id: 1, all_tags:'meat,ketchup, microwave'})
Supplier.new({name:'Åre Bageri', email:'info@arebageri.se', address:'Årevägen 55', city:'Åre', website:'arebageri.se', phone:'0647-52320', user_id: users(:tom).id, all_tags:'bread,deli'})
Supplier.new({name:'Elgiganten', email:'info@elgiganten.se', address:'Möbelvägen 52', city:'Jönköping', website:'elgiganten.se', phone:'1234568', user_id: users(:tom).id, all_tags:'technology'})
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'first@first.com', password: '111111', first_name: 'Test', last_name: 'Test')
brand = Brand.create(name: 'Audi')
model = Model.create(brand_id: brand.id, name: 'A4')

Advert.create(
  model: model,
  user: user,
  engine: 'V6',
  conditioner: true,
  condition: false,
  price: 10000,
  distance_covered: 10000,
  year: 2010,
  color: 'blue'
)

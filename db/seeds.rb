# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

materials = %w(paper pen pencil glass lightsaber laptop 9v-battery aaa-battery water cola binder paperclip stapler)

30.times do
  Invention.create(
    title: Faker::Zelda.character,
    description: Faker::Company.bs,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    bits: Bit.pluck(:oid).sample(rand(1..Bit.all.count)),
    materials: materials.sample(rand(0..materials.count))
  )
end

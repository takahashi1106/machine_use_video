# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    last_name: '管理者',
    first_name: '太郎',
    tel_number: '090-0000-0000',
    email: 'test@test.com',
    password: '000000',
    admin: true,
)
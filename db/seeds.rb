# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(
    email: ENV['ADMIN_MAIL'],
) do |admin|
    admin.password = ENV['ADMIN_PASSWORD']
end

genres = %w(発電機 草刈機 削岩機 溶接機 重機 切断機 水中ポンプ) # ポイント1
genres.each do |genre|
  Genre.find_or_create_by(name: genre) # ポイント2
end

users = [
  {last_name: '管理者', first_name: '太郎', email: 'test@test.com',          tel_number: '090-0000-0000', password: '000000'},
  {last_name: '高橋', first_name: '勝喜',   email: 'tk2696274@gmail.com',    tel_number: '080-2020-3030', password: 'katsuki1106'},
  {last_name: 'user', first_name: '1',      email: 'user@1.com'   , tel_number: '090-1111-1111', password: '111111'},
  {last_name: 'user', first_name: '2',      email: 'user@2.com'   , tel_number: '090-2222-2222', password: '222222'},
  {last_name: 'user', first_name: '3',      email: 'user@3.com'   , tel_number: '090-3333-3333', password: '333333'},
  {last_name: 'user', first_name: '4',      email: 'user@4.com'   , tel_number: '090-4444-4444', password: '444444'},
  {last_name: 'user', first_name: '5',      email: 'user@5.com'   , tel_number: '090-5555-5555', password: '555555'},
  {last_name: 'user', first_name: '6',      email: 'user@6.com'   , tel_number: '090-6666-6666', password: '666666'},
  {last_name: 'user', first_name: '7',      email: 'user@7.com'   , tel_number: '090-7777-7777', password: '777777'},
  {last_name: 'user', first_name: '8',      email: 'user@8.com'   , tel_number: '090-8888-8888', password: '888888'},
  {last_name: 'user', first_name: '9',      email: 'user@9.com'   , tel_number: '090-9999-9999', password: '999999'},
]

users.each do |user|
  # 一度ユーザーをメールアドレスで検索
  user_data = User.find_by(email: user[:email])
  # 該当ユーザーがいなければ、createする
  if user_data.nil?
    User.create(
      last_name: user[:last_name],
      first_name: user[:first_name],
      email: user[:email],
      tel_number: user[:tel_number],
      password: user[:password],
    )
  end
end
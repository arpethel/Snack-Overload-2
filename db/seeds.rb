# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :user_keys =>
    ["name", "email", "password"],
  :users => [
    ["Max Charles", "max@max.com", "password"],
    ["Skai Jackson", "skai@skai.com", "password"]
  ],
  :post_keys =>
   ["title", "ingredients", "directions", "cooktime", "chef", "caption"],
  :posts => [
    ["Scrambled Eggs", "2 eggs, 1 slice of cheese, 1 teaspoon of butter", "heat pan, place butter inside and let melt. place cheese and let melt. add in eggs and cook thouroughly", 5, "Max", "yum yum"],
    ["Chocolate Chip Cookies", "cookie batter", "cook thouroughly", 15, "Skai", "yum cookies!"]
  ],
  :admins => [
    "Mary",
    "John"
  ]
}

def main
  make_users
  make_admin
  make_posts
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |name|
    User.create(name: name, email: "admin@admin.com", password: 'password', admin: true)
  end
end

def make_posts
  DATA[:posts].each do |post|
    new_post = Post.new
    post.each_with_index do |attribute, i|
      new_post.send(DATA[:post_keys][i] + "=", attribute)
    end
    rand(1..8).times do
      profiles = []
      User.all.each {|u| profiles << u if u.admin != true}
      new_post.users << profiles[rand(0...profiles.length)]
    end
    new_post.users.each {|c| c.save}
    new_post.save
  end
end

main

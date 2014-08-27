# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Post.destroy_all

user = User.create(email: 'marco@araujo.com', password: '12345678', password_confirmation: '12345678')
user2 = User.create(email: 'lucila@melendez.com', password: '12345678', password_confirmation: '12345678')
users = [user, user2]

1.upto(10) do |n|
	tags = ['#surf', '#wave', '#mexico', '#sun', '#beach', '#sand', '#warmweather']
	users.sample.posts.create(title: "Post number #{n}", picture: File.new('spec/images/surf2.jpg'), price: "#{n * 10}", tags_list: tags.sample(2).join(' '), address: '25 city road, london')
end
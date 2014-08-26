# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all

1.upto(10) do |n|
	tags = ['#surf', '#wave', '#mexico', '#sun', '#beach', '#sand', '#warmweather']
	Post.create(title: "Post number #{n}", picture: File.new('spec/images/surf2.jpg'), price: "#{n * 100}", tags_list: tags.sample(2).join(' '), address: '25 city road, london')
end
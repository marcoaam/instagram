require 'rails_helper'

RSpec.describe Post, :type => :model do
	context 'Tags' do

		let(:post) { Post.create(title: 'Great day') }

		it 'has no tags' do
			post.tags_list = ''
			expect(post.tags).to be_empty
		end

		it 'has one tag' do
			post.tags_list = '#makers'
			expect(post.tags.first.text).to eq '#makers'
		end

		it 'has more than tag' do
			post.tags_list = '#makers #webdevelopment'
			expect(post.tags.all.count).to eq 2
		end

		it 'doesnt save a duplicate tag' do
			post.tags_list = '#makers #makers'
			expect(post.tags.all.count).to eq 1
		end

		it 'uses the same tag if the tag already exist' do
			post2 = Post.create(title: 'Awesome')
			post2.tags_list = '#makers'
			post.tags_list = '#makers'
			expect(Tag.all.count).to eq 1
		end

	end

	context 'Price' do

		let(:post) { Post.create(title: 'Great day', price: 10) }
		let(:post2) { Post.create(title: 'Great day', price: 5) }

		it 'Converts the amount in stripe required amount' do
			expect(post.price_in_cents).to eq 100
		end

		it 'Converts the amount in stripe required amount' do
			expect(post2.price_in_cents).to eq 50
		end

	end

end

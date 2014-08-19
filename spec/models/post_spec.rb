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

	end

end

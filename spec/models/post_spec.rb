require 'rails_helper'

RSpec.describe Post, :type => :model do
	context 'Tags' do

		let(:post) { Post.create(title: 'Great day') }

		it 'has no tags' do
			expect(post.tags.all).to be_empty
		end

		it 'has one tag' do
			
		end

	end

end

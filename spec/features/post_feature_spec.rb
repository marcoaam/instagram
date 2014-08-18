require 'rails_helper'

describe 'Posts' do

	context 'Without posts created' do

		it 'shows a message' do
			visit '/posts'
			expect(page).to have_content 'No posts have been added'
		end

		it 'can create a post filling a form' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Amazing day at Makers'
			click_button 'Create Post'
			expect(current_path).to eq posts_path
		end

	end

	context 'With posts created' do

		before(:each) do
			Post.create(title: 'Amazing day at Makers')
		end

		it 'shows all posts' do
			visit '/posts'
			expect(page).to have_content 'Amazing day at Makers'
		end

	end
	
end
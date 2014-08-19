require 'rails_helper'

describe 'Posts' do

	context 'Without posts created' do

		before(:each) do
			marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			login_as marco
		end

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

		it 'can create a post with a picture' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Amazing day at Makers'
			attach_file 'Picture', Rails.root.join('spec/images/surf2.jpg')
			click_button 'Create Post'
			expect(page).to have_css('img.uploaded_pic')
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

		it 'does not show posts if s user is not logged in' do
			visit ('/posts')
			click_link 'New post'
			expect(page).to have_content 'Sign in'
		end

		it 'shows a sign in button' do
			visit ('/posts')
			click_link 'Sign in'
			expect(page).to have_content 'Sign in'
		end

		it 'shows a sign up button' do
			visit ('/posts')
			click_link 'Sign up'
			expect(page).to have_content 'Sign up'
		end

	end

end
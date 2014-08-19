require 'rails_helper'

describe 'Tagging' do

	context 'Without tags' do

		before(:each) do
			marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			login_as marco
		end

		it 'Can create a post with tags' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Great day at Makers'
			fill_in 'Tags', with: '#makers #webdevelopment'
			click_button 'Create Post'

			expect(page).to have_link '#makers'
			expect(page).to have_link '#webdevelopment'
		end

	end

	context 'With tags' do

		before(:each) do
			marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			login_as marco
			Post.create(title: 'Love coding', tags_list: '#makers #web')
			Post.create(title: 'Web development', tags_list: '#web')
		end

		it 'Shows the posts that belong to the tag when clicked' do
			visit('/posts')
			click_link '#makers'
			expect(page).not_to have_content('Web development')
			expect(page).to have_content('Love coding')
		end

	end
	
end
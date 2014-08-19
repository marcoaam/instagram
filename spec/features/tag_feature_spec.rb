require 'rails_helper'

describe 'Tagging' do

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
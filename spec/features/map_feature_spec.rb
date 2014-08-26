require 'rails_helper'

describe 'Maps' do

	before(:each) do
		marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		Post.create(title: 'Amazing day at Makers', address: 'London, UK')
		login_as marco
	end

	it 'can show the post in a map', js: true do
		visit '/posts'
		click_link 'Map'
		expect(page).to have_css '.gm-style'
	end

end
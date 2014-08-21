require 'rails_helper'

describe 'User' do

	it 'can sign up', js: true do
		visit ('/posts')
		click_button 'Sign up'
		within(".modal-content") do
			fill_in ('user[email]'), with: 'm@m2.com', match: :prefer_exact
			fill_in ('user[password]'), with: '12345678', match: :prefer_exact
			fill_in ('user[password_confirmation]'), with: '12345678', match: :prefer_exact
			click_button 'Submit'
		end
		expect(User.first.email).to eq 'm@m2.com'
	end

	it 'can sign out' do
		marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		login_as marco
		visit '/posts'
		click_link 'Sign out'
		expect(page).to have_content 'Signed out successfully'
	end

  it 'can sign in' do
    User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
    visit ('/posts')
    fill_in ('user[email]'), with: 'm@m.com', match: :prefer_exact
    fill_in ('user[password]'), with: '12345678', match: :prefer_exact
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

end
require 'rails_helper'

describe 'User' do

	it 'can sign up' do
		visit ('/posts')
		click_button 'Sign up'
		fill_in ('user[email]'), with: 'm@m.com'
		fill_in ('user[password]'), with: '12345678'
		fill_in ('user[password_confirmation]'), with: '12345678'
		click_button 'Submit'
		expect(User.first.email).to eq 'm@m.com'
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
    visit ('/users/sign_in')
    fill_in ('user[email]'), with: 'm@m.com'
    fill_in ('user[password]'), with: '12345678'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

end
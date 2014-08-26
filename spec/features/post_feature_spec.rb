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

		it 'creates a posts with a price' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Amazing day at Makers'
			fill_in 'Price', with: '5'
			attach_file 'Picture', Rails.root.join('spec/images/surf2.jpg')
			click_button 'Create Post'
			expect(page).to have_css '.buy_now'
			expect(page).to have_content '$ 5'
		end

	end

	context 'With posts created' do

		before(:each) do
			Post.create(title: 'Amazing day at Makers', price: 5)
		end

		it 'shows all posts' do
			visit '/posts'
			expect(page).to have_content 'Amazing day at Makers'
		end

		it 'does not show posts if s user is not logged in' do
			visit ('/posts')
			expect(page).not_to have_link 'New post'
		end

		it 'shows a sign in button' do
			visit ('/posts')
			expect(page).to have_button 'Sign in'
		end

		it 'shows a sign up button' do
			visit ('/posts')
			click_button 'Sign up'
			expect(page).to have_content 'Sign up'
		end

		it 'can take a payment', js: true do
			visit '/posts'
			page.find('button.stripe-button-el').click
			Capybara.within_frame 'stripe_checkout_app' do
		    fill_in 'Email', :with => 'persona@example.com'
		    fill_in "Card number", :with => "4242424242424242"
		    fill_in 'CVC', :with => '123'
		    fill_in 'MM / YY', :with => '11/14'

		    click_button 'Pay $5.00'
			end
			expect(current_path) == posts_path
		end

	end

end
class ChargesController < ApplicationController

	def create
	  post = Post.find(params[:post_id])
	  @amount = post.price_in_cents

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  redirect_to '/posts'

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to '/posts'
	end	
	
end
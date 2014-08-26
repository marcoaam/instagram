class ChargesController < ApplicationController

	def new
	end

	def create
	  post = Post.find(params[:post_id])
	  @amount = post.price

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

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to '/posts'
		end
	end
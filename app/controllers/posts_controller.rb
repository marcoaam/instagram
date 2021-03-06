class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.reverse
	end

	def new
		@post = Post.new
	end

	def create
		post = current_user.posts.create(params[:post].permit(:title, :picture, :price, :tags_list, :address))
		Pusher['instagram_test'].trigger('my_event', {
      message: 'New posts have been added'
    })
		redirect_to '/posts'
	end

	def show
		@post = Post.find(params[:id]) 
	end

end

class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all.reverse
	end

	def new
		@post = Post.new
	end

	def create
		Post.create(params[:post].permit(:title, :picture, :tags_list))
		redirect_to '/posts'
	end

end

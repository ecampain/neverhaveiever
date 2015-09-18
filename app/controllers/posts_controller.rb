class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to @post
	end

	def upvote 
        @post = Post.find(params[:id])
    	session[:voting_id] = request.remote_ip
   		voter = Session.find_or_create_by(ip: session[:voting_id])
    	@post.upvote_by voter
      	redirect_to post_path
  	end

private

	def post_params
		params.require(:post).permit(:entry)
	end

end

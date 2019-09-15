class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        @post.save
        redirect_to current_user
    end
    
    def show
        @post = Post.find_by(id: params[:id])
        @user = current_user
    end

    def index
        @user = current_user
        @posts = Post.all
    end

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        @post.update(post_params)

        redirect_to @post
    end

    private
    def post_params
        params.require(:post).permit(:title, :ingredients, :directions, :cooktime, :chef, :caption)
    end
end
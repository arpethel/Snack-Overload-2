class RecipesController < ApplicationController
    def create
        post = Post.find_by(id: params[:post_id])
        @recipe = post.recipes.build(user: current_user)
        @recipe.save
        session[:message] = @recipe.take_recipe
        redirect_to current_user
    end
end
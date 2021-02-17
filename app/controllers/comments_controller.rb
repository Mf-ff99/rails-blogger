class CommentsController < ApplicationController

    def create 
        @post = Post.find(params[:post_id])
    end

    def destroy
        @post = Post.find(params[:post_id])
    end

    
end

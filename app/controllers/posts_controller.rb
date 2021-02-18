class PostsController < ApplicationController

    def index 
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create 
        @post = Post.new(post_params)
        
        @post.user_id = current_user.id

        if @post.save 
            redirect_to @post
        else
            render 'new'
        end
    end

    def update 
        @post = Post.find(params[:id])
        

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end

    end

    def edit
        @post = Post.find(params[:id])
    end

    def show 
        @post = Post.find(params[:id])
    end
    
    def destroy
        @post = Post.find(params[:id])
        
        @post.destroy
        redirect_to posts_path
    end

    def correct_user
        @user = current_user.posts.find_by(id: params[:id])
        redirect_to root_path, notice: 'not authorized to be here'
    end

    def post_params 
        params.require(:post).permit(:title, :content, :user_id)
    end


    
    private

    def post_params 
        params.require(:post).permit(:title, :content)
    end


end

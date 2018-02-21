class LikesController < ApplicationController
    
    before_action :authenticate_user
    
    
    def create
    @like = Like.new(user_id: @current_user.id,post_id: params[:post_id])
    
    @like.save
    
    @user = User.find(@current_user.id)
    @user.user_exp += 1
    @user.save
    
    @post = Post.find(params[:post_id])
    @user = User.find(@post.user.id)
    @user.user_exp += 1
    @user.save
    
    redirect_to("/posts/#{params[:post_id]}")

    end
    
    def destroy
        @like = Like.find_by(user_id: @current_user.id,post_id: params[:post_id])
        @like.destroy
        
        @user = User.find(@current_user.id)
        @user.user_exp -= 1
        @user.save
        
        @post = Post.find(params[:post_id])
        @user = User.find(@post.user.id)
        @user.user_exp -= 1
        @user.save
        
        redirect_to("/posts/#{params[:post_id]}")
        
    end
    
end

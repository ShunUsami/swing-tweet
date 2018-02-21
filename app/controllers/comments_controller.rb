class CommentsController < ApplicationController
   before_action :authenticate_user
   
   def create
       @comment = Comment.new(content:params[:content],
                              user_id: @current_user.id,
                              post_id: params[:post_id])
       @comment.save
       
       @user = User.find(@current_user.id)
       @user.user_exp += 3
       @user.save
       
       @post = Post.find(params[:post_id])
       @user = User.find(@post.user.id)
       @user.user_exp += 3
       @user.save
       
       redirect_to("/posts/#{@comment.post_id}")
    end
   
   def destroy
       @user = User.find(@current_user.id)
       @user.user_exp -= 3
       @user.save
      
      @comment = Comment.find_by(id: params[:id])
       @post = Post.find(@comment.post_id)
       @user = User.find(@post.user.id)
       @user.user_exp -= 3
       @user.save
      
      @post = @comment.post_id
      @comment.destroy
      
       redirect_to("/posts/#{@post}")
       
   end
   
   
end

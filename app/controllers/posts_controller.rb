class PostsController < ApplicationController
    
    before_action :authenticate_user
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    
  def index
      @posts = Post.all.order(created_at: :desc)
  end
  
  def show
      @post = Post.find_by(id: params[:id])
      @user = @post.user
      @likes_count = Like.where(post_id: @post.id).count
      @comment = Comment.find_by(id: params[:id])
  end
  
  def new
      @post = Post.new
  end
  
  def create
      
      @post = Post.new(content:params[:content],
                       user_id: @current_user.id,
                       )
      @post.save
      
      @user = User.find(@current_user.id)
      @user.user_exp += 5
      @user.save
                       
    if params[:image]
     @post.image_name = "#{@post.id}.jpg"
     image = params[:image]
     File.binwrite("public/post_images/#{@post.image_name}",image.read)
    end
                       
      if @post.save
          redirect_to("/posts/index")
          else
          render("posts/new")
      end
  end
  
  def edit
  @post = Post.find_by(id: params[:id])
  end
  
  def update
      @post = Post.find_by(id: params[:id])
      @post.content = params[:content]
      if @post.save
          redirect_to("/posts/index")
          else
          render("posts/edit")
      end
  end
  
  def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to("/posts/index")
      
      @user = User.find(@current_user.id)
      @user.user_exp -= 5
      @user.save
  end
  
  def ensure_correct_user
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
          flash[:notice] = "権限がありません"
          redirect_to("/posts/index")
      end
      
  end
  
end

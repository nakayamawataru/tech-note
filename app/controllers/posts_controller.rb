class PostsController < ApplicationController
  #new.create.edit.update.destroyはログイン必須
  def new
    @post = Post.new
  end
  
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end
  
  
  def create
    @post = Post.new(title:params[:title],content:params[:content],user_id: 1) 
    #current_user.idにする
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/")
    else
      render("posts/new")
    end
  end
  
  
  def edit
    @post=Post.find_by(id: params[:id])
  end
  
  
  def update
    @post=Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    
    if @post.save
      flash[:notice] = "保存しました"
      redirect_to("/")
    else
      render("posts/edit")
    end
    
  end
  
  
end

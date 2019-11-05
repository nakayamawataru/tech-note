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
    @post = Post.new(title:params[:title],content:params[:content],user_id:[@current_user.id])
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/")
    else
      render("posts/new")
    end
  end
end

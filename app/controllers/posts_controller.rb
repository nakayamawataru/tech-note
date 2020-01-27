class PostsController < ApplicationController
  before_action :authenticate_user,only:[:new,:create,:edit,:update,:destroy]
  before_action :ensure_correct_user,only:[:edit,:update,:destroy]

  def new
    @post = Post.new
  end
  
  
  def show
    @post = Post.find_by(id: params[:id])
    if @post.youtube_url
      @youtube_url = @post.youtube_url
      @url = @youtube_url.last(11)#埋め込みURLなどにも対応するときに使う
    end
    @user = @post.user
    @likes_count = Like.where(post_id:@post.id).count
  end
  
  
  def create
    @post = Post.new(title: params[:title],
                     content: params[:content],
                     user_id: @current_user.id,
                     youtube_url: params[:youtube_url]) 
    @post.save
    
    if params[:post_image]
      @post.post_image = "#{@post.id}.jpg"
      image = params[:post_image]
      File.binwrite("public/assets/post_images/#{@post.post_image}",image.read)
    end
    
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
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/")
  end
  
  def ensure_correct_user
    @post=Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
  
end

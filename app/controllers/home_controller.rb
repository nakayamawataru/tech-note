class HomeController < ApplicationController
  PER = 10
  
  def index
    if params[:search].blank?
      @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(PER)
    else
      @search = params[:search]
      @posts = Post.where("(title LIKE ?) or (content LIKE ?)", "%#{@search}%","%#{@search}%").page(params[:page]).per(PER)
    end
    
    @likes = Like.all.order(created_at: "DESC")
    @recent_likes = @likes.first(5)
    @users = User.all.order(created_at: "DESC")
  end
  
end

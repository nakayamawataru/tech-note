class HomeController < ApplicationController
  PER = 10
  
  def index
    if params[:search].blank?
      @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(PER)
    else
      @search = params[:search]
      @posts = Post.where("(title LIKE ?) or (content LIKE ?)", "%#{@search}%","%#{@search}%").page(params[:page]).per(PER)
    end
    
  end
  
end

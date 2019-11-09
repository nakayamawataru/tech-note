class HomeController < ApplicationController
  
  def index
    if params[:search].blank?
      @posts = Post.all.order(created_at: :desc)
    else
      @search = params[:search]
      @posts = Post.where("title LIKE ?", "%#{@search}%")
    end
    
  end
  
end

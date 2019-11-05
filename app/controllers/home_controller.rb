class HomeController < ApplicationController
  def top
    @posts=Post.all.order(create_at: :desc)#降順
  end
end

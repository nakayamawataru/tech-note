class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user=User.new
  end
  
  def create
    @user=User.new(
      name:params[:name],
      mail:params[:mail],
      password:params[:password],
      image_name:"default.jpg"
      )
      if @user.save
        flash[:notice] = "ようこそTech Noteへ"
        redirect_to("/")
      else
        render("user/new")
      end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
     @user.name = params[:name]
     @user.mail = params[:mail]
     @user.password = params[:password]
      if params[:image_name]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image_name]
        File.binwrite("public/user_images/#{@user.image_name}",image.read)
      end
    
     if @user.save
       flash[:notice] = "編集しました"
       redirect_to("/")
     else
       render("users/edit")
     end
    
  end
  
end

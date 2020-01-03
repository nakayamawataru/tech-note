class UsersController < ApplicationController
  before_action :authenticate_user,only:[:edit,:update,:logout]
  before_action :forbid_login_user,only:[:login_form,:login]
  before_action :ensure_correct_user,only:[:edit,:update]
  
  PER = 5

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.page(params[:page]).per(PER)
    @likes = @user.likes
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
        session[:user_id] = @user.id
        redirect_to("/")
      else
        render("users/new")
      end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
     @user.name = params[:name]
     @user.mail = params[:mail]

      if params[:image_name]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image_name]
        File.binwrite("public/assets/user_images/#{@user.image_name}",image.read)
      end
    
     if @user.save
       flash[:notice] = "編集しました"
       redirect_to("/")
     else
       render("users/edit")
     end
    
  end
  
  def login_form
  end
  
  
  def login
    @user = User.find_by(mail:params[:mail])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message="メールアドレスまたはパスワードが間違っています"
      @mail=params[:mail]
      render("users/login_form")
    end
    
  end
  
  def logout
    
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")

  end
  
  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    if @user.id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end  
end

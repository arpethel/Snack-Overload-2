class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    
    session[:user_id] = @user.id
    render 'welcome/home'

    # if !@user.save
      
    #   @user = User.new(login_params)
    #   session[:user_id] = @user.id
    #   redirect_to @user
    # end
    
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
  
  private
  
  def auth
    request.env['omniauth.auth']
  end

  def login_params
    params.require(:user).permit(:name, :password)
  end
end
class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:username],
    params[:user][:password]
    )

    if @user
      login(@user)
      render json: @user
    else
      flash.now[:errors] = ["invalid username or password"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end

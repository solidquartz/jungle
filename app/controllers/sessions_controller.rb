class SessionsController < ApplicationController

def new
  
  end

  def create

    user = User.authenticate_with_credentials(params[:login][:email], params[:login][:password]) 
    if !user.nil?
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: "Successfully logged in!"
    else
      # if email or password incorrect, re-render login page:
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

end

class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        # Successful registration
        flash[:success] = 'Registration successful! Please log in.'
        redirect_to login_path
      else
        flash[:danger] = 'Password mismatch'
        redirect_to new_user_path
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  end

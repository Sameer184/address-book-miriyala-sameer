class SessionsController < ApplicationController
    include SessionsHelper

    def new
    end
  
    def create
      user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        # Login the user
        log_in user
        flash[:success] = 'Hi ' + user.username + '! Welcome to your Address Book.'
  
        # Redirect to /people
        redirect_to people_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  
    def destroy
      # Logout the user
      flash[:success] = 'Bye! Come back soon...'
      log_out

      # Redirect to landing page
      redirect_to login_path
    end
  end

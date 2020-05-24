class SessionsController < ApplicationController
    
    before_action :message, only: [:new]

    def new
  
    end
  
    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          if user.email_confirmed
            session[:user_id] = user.id
            redirect_to root_url
          else
            flash.now[:alert] = "Ative a sua conta!"
          end
        else
          flash.now[:alert] = "Email ou senha inválida!"
          render "new"
        end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url
    end

    private
    
    def message
        @msg = params[:message]
    end
  
end
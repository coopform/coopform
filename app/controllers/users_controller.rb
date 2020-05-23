class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                UserMailer.registration_confirmation(@user).deliver_now!
                format.html { redirect_to mail_info_path }
            else
                format.html { render :new }
            end
        end
    end
    
    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.update(:email_confirmed => true)
            redirect_to activated_path(user.id)
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :company)
    end

end
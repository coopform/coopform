class UserMailer < ApplicationMailer

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.email}", :subject => "Confirm your registration")
    end

end
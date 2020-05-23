class WelcomeController < ApplicationController

    def home
        
    end

    def activated
        @name = User.find_by_id(params[:id]).name
    end

    def mail_info

    end

end
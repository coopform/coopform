class AboutController < ApplicationController
    before_action :check_logged_in

    def about_pdf

    end

    def about_word

    end

    private

    def check_logged_in
        if !logged_in?
            redirect_to root_path
        end
    end

end
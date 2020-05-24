class DocumentsController < ApplicationController

    before_action :check_logged_in
    before_action :pick_category, only: [:document_create]

    def generate
        @people = Team.where(:user_id => current_user.id)
        @answears = Answear.get_for_user(current_user.id)
        puts @answears
        respond_to do |format|
            format.pdf do
                case current_user.category_id
                    when 1
                        render pdf: "Cooperativa com conselho de administração",
                        template: "documents/one.html.erb",
                        layout: "pdf.html"
                    when 2
                        render pdf: "Cooperativa com diretoria",
                        template: "documents/two.html.erb",
                        layout: "pdf.html"
                    when 3
                        render pdf: "Cooperativa de trabalho (Lei 12690)",
                        template: "documents/three.html.erb",
                        layout: "pdf.html"
                end
            end
        end
    end

    def category_pick
        if !params[:id].nil?&&params[:id]!=""
            if !current_user.category_id.nil?
                Answear.where(:user_id => current_user.id).delete_all
                Team.where(:user_id => current_user.id).delete_all
            end
            User.find(current_user.id).update(:category_id => params[:id])
            redirect_to document_create_path
        end
        @categories = Category.all
    end

    def document_create
        redirect_to category_pick_path if current_user.category_id.nil?
        if params[:action_type]=="persons"
            if params[:hidden_type]=="add"
                Team.new(:user_id => current_user.id, :person => params[:hidden_person]).save
            else
                Team.where(:user_id => current_user.id, :person => params[:hidden_person]).last.delete
            end
        elsif params[:action_type]=="save"
                Answear.where(:user_id => current_user.id).delete_all
                Answear.new(:user_id => current_user.id, :number => 1, :value => params[:ans_1]).save
                Answear.new(:user_id => current_user.id, :number => 2, :value => params[:ans_2]).save
                Answear.new(:user_id => current_user.id, :number => 3, :value => params[:ans_3]).save
                Answear.new(:user_id => current_user.id, :number => 4, :value => params[:ans_4]).save
                Answear.new(:user_id => current_user.id, :number => 5, :value => params[:ans_5]).save
                Answear.new(:user_id => current_user.id, :number => 6, :value => params[:ans_6]).save
                Answear.new(:user_id => current_user.id, :number => 31, :value => params[:ans_3_1]).save
                Answear.new(:user_id => current_user.id, :number => 7, :value => params[:ans_7]).save
                Answear.new(:user_id => current_user.id, :number => 8, :value => params[:ans_8]).save
                Answear.new(:user_id => current_user.id, :number => 81, :value => params[:ans_8_1]).save
                Answear.new(:user_id => current_user.id, :number => 9, :value => params[:ans_9]).save
                Answear.new(:user_id => current_user.id, :number => 91, :value => params[:ans_9_1]).save
                Answear.new(:user_id => current_user.id, :number => 10, :value => params[:ans_10]).save
                Answear.new(:user_id => current_user.id, :number => 101, :value => params[:ans_10_1]).save
                Answear.new(:user_id => current_user.id, :number => 11, :value => params[:ans_11]).save
                Answear.new(:user_id => current_user.id, :number => 12, :value => params[:ans_12]).save
            @msg = "Data saved successfully"
        end
        @category = Category.find(current_user.category_id)
        @people = Team.where(:user_id => current_user.id)
        @answears = Answear.get_for_user(current_user.id)
        respond_to do |format|
            format.html
            format.js
        end
    end

    private

    def check_logged_in
        if !logged_in?
            redirect_to login_path(message: 'You have to be logged in to create partnership!')
        end
    end

    def pick_category
        if logged_in?&&current_user.category_id.nil?
            redirect_to category_pick_path
        end
    end

end
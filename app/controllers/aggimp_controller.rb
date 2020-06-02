class AggimpController < ApplicationController
    
    def aggiungi
        @user = User.find_by(:email => params[:email])
        @user.employee = true
        @user.save
        redirect_to '/profiles/aggimp'
    end
end

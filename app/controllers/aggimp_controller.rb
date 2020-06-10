class AggimpController < ApplicationController
    
    def index
        @users= User.all
    end

    def aggiungi
        @user = User.find_by(:email => params[:email])
        @user.employee = true
        @user.save
        redirect_to '/profiles/success'
    end

    def lista
        @message ="uigo"
      end

    def rimuovi
        @user = User.find_by(:email => params[:email])
        @user.employee = false
        @user.save
        redirect_to '/profiles/success'
    end

    def banna
        @user = User.find_by(:email => params[:email])
        User.delete(@user.id)
        redirect_to '/profiles/success'
    end
end

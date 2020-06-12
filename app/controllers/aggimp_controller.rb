class AggimpController < ApplicationController
    
    helper_method :lista

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
        redirect_to '/profiles/success'
    end

    def rimuovi
        @user = User.find_by(:email => params[:email])
        @user.employee = false
        @user.save
        redirect_to '/profiles/success'
    end

    def rimuovispecificato
        @user = User.find_by(:id => params[:user_id])
        @user.employee = false
        @user.save
        redirect_to '/profiles/success'
    end

    def banna
        @user = User.find_by(:email => params[:email])
        User.delete(@user.id)
        redirect_to '/profiles/success'
    end

    def modificainfo
        @user = User.find_by(:email => current_user.email) 
        @nome = params[:nome]
        if @nome!=''
            @user.nome = @nome
        end

        @cognome = params[:cognome]
        if @cognome!=''
            @user.cognome = @cognome
        end

        @dataNascita = params[:dataNascita]
        if @dataNascita!=''
            @user.dataNascita = @dataNascita
        end

        @luogoNascita = params[:luogoNascita]
        if @luogoNascita!=''
            @user.luogoNascita = @luogoNascita
        end

        @sesso = params[:sesso]
        if @sesso!=''
            @user.sesso = @sesso
        end

        @user.save
        redirect_to '/profiles/myprofile'
    end

end

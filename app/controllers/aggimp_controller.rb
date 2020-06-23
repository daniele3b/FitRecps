class AggimpController < ApplicationController
    
    helper_method :lista

    def index
        @users= User.all
    end

    def aggiungi
        if(current_user.admin)
            @user = User.find_by(:email => params[:email])
            @user.employee = true
            @user.save
            redirect_to '/profiles/success'
        elsif
            flash.now[:notice] = 'Non sei autorizzato!'
        end
    end

    def lista
        @message ="uigo"
        redirect_to '/profiles/success'
    end

    def rimuovi
        if(current_user.admin)
            @user = User.find_by(:email => params[:email])
            @user.employee = false
            @user.save
            redirect_to '/profiles/success'
        elsif
            flash.now[:notice] = 'Non sei autorizzato!'
        end
    end

    def rimuovispecificato
        if(current_user.admin)
            @user = User.find_by(:id => params[:user_id])
            @user.employee = false
            @user.save
            redirect_to '/profiles/success'
        elsif
            flash.now[:notice] = 'Non sei autorizzato!'
        end
    end

    def banna
        if(current_user.admin)
            @user = User.find_by(:email => params[:email])
            User.delete(@user.id)
            redirect_to '/profiles/success'
        elsif
            flash.now[:notice] = 'Non sei autorizzato!'
        end
    end
            
    def modificainfo
        @user = User.find_by(:email => current_user.email) 
        @nome = params[:nome]
        if @nome!=""
            @user.nome = @nome
        end

        @cognome = params[:cognome]
        if @cognome!=""
            @user.cognome = @cognome
        end

       # @dataNascita = params[:dataNascita]
       #if @dataNascita!=''
        #    @user.dataNascita = @dataNascita
        #end
        #@user.cf = @dataNascita

        @luogoNascita = params[:luogoNascita]
        if @luogoNascita!=""
            @user.luogoNascita = @luogoNascita
        end

        @sesso = params[:sesso]
        if @sesso!=""
            @user.sesso = @sesso
        end

        @user.save

        @user = User.find_by(:email => current_user.email)   
        #@user.cf ='franco'
        require 'net/http'
        @nome2 = @user.nome
        @cognome2 = @user.cognome
        @comunenascita2 = @user.luogoNascita 
        @datanascita2 = @user.dataNascita
        
        if @user.sesso=='Maschio'
            @sesso2='m'
        elsif @user.sesso=='Femmina'
            @sesso2='f'
        end
        
        @uri ='http://webservices.dotnethell.it/codicefiscale.asmx/CalcolaCodiceFiscale?Nome='+@nome2+'&Cognome='+@cognome2+'&ComuneNascita='+@comunenascita2+'&DataNascita='+@datanascita2+'&Sesso='+@sesso2 
        url = URI.parse(@uri)
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
        }
        
        @user.cf =res.body.to_s[103, 16]
        @user.save

        redirect_to '/profiles/myprofile'
    end

end

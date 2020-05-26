class CardsController < ApplicationController

    def index
        @cards= Card.all
    end

    def create
        @durata=params[:durata]
        @zona=params[:zona]
        @categoria=params[:categoria]
        @esercizi=params[:esercizi]
        @tutorial=params[:tutorial]
        @energia=params[:energia]
        @chiave=SecureRandom.urlsafe_base64(50, false)
       
        @card= Card.create(:idf=>@chiave,:categoria=>@categoria,:durata=>@durata,:energia=>@energia,:zona=>@zona,:esercizi=>@esercizi,:tutorial=>@tutorial,:user_id=>current_user.id)
        @card.save!
        redirect_to cards_url
    end

    def new
    
    end 

    def show
        @card=Card.find(params[:id])

    end

end

class CardsController < ApplicationController

    def index
        @data = Card.all
    end

    def create
        @durata=params[:durata]
        @zona=params[:zona]
        @categoria=params[:categoria]
        @esercizi=params[:esercizi]
        @tutorial=params[:tutorial]

        puts(@categoria)
       @card= Card.create(:idf=>@durata,:categoria=>@categoria,:durata=>@durata,:zona=>@zona,:esercizi=>@esercizi,:tutorial=>@tutorial,:user_id=>current_user.id)
       @card.save!
        redirect_to cards_url
    end

    def new
    
    end 

    def show
    end

end

class CardsController < ApplicationController

    def index
        @cards= Card.all
    end

    def destroy
        @card=Card.find(params[:id])


        @rev=Review.where(cards:params[:id])

        @rev.delete_all
        @card.destroy

        redirect_to profiles_mycards_url
    end

    def create
        @durata=params[:durata]
        @zona=params[:zona]
        @categoria=params[:categoria]
        @esercizi=params[:esercizi]
        @tutorial=params[:tutorial]
        @energia=params[:energia]
        @chiave=SecureRandom.urlsafe_base64(50, false)

      
       
        @card= Card.create(:idf=>@chiave,:interazioni=>0,:spiegazione=>params[:path],:categoria=>@categoria,:durata=>@durata,:energia=>@energia,:zona=>@zona,:esercizi=>@esercizi,:tutorial=>@tutorial,:user_id=>current_user.id)
        @card.save!
      
        redirect_to cards_url
    end

    def new
   
    end 


    def edit
      
        @card=Card.find(params[:id])
    end

    def show
        
        @card=Card.find(params[:id])
       @val=@card.interazioni
       @val=@val+1
       @card.interazioni=@val
       @card.save!


    end

    def update

     
        @durata=params[:durata]
        @zona=params[:zona]
        @categoria=params[:categoria]
        @esercizi=params[:esercizi]
        @tutorial=params[:tutorial]
        @energia=params[:energia]
        @card=Card.find(params[:id])

        @card.update_attributes!(params[:card].permit(:durata,:zona,:categoria,:esercizi,:tutorial,:energia,:spiegazione))
	

        redirect_to profiles_mycards_url
    end

    def filter


    end

    def visualizza
        @categoria=params[:categoria]
        @e_min=params[:energia_min]
        @e_max=params[:energia_max]
        @zona=params[:zona]

        if (@categoria!=''&&@e_min!='' &&@e_max!=''&&@zona!='')
            @cards=Card.where(energia: (@e_min.to_i)..(@e_max.to_i),categoria: @categoria, zona: @zona)
        end

        if(@categoria==''&&@e_min!='' &&@e_max!=''&&@zona!='')
            @cards=Card.where(energia: (@e_min.to_i)..(@e_max.to_i), zona: @zona)
        end

        if (@categoria!=''&&@e_min=='' &&@e_max!=''&&@zona!='')
            @cards=Card.where(energia: (0)..(@e_max.to_i),categoria: @categoria, zona: @zona)
        end

        if (@categoria!=''&&@e_min!='' &&@e_max==''&&@zona!='')
            @cards=Card.where(energia: (@e_min.to_i)..(20000),categoria: @categoria, zona: @zona)
        end

        if (@categoria!=''&&@e_min!='' &&@e_max!=''&&@zona=='')
            @cards=Card.where(energia: (@e_min.to_i)..(@e_max.to_i),categoria: @categoria)
        end

        if (@categoria!=''&&@e_min!='' &&@e_max==''&&@zona=='')
            @cards=Card.where(energia: (@e_min.to_i)..(20000),categoria: @categoria)
        end

        if (@categoria!=''&&@e_min=='' &&@e_max!=''&&@zona=='')
            @cards=Card.where(energia: (0)..(@e_max.to_i),categoria: @categoria)
        end

        if (@categoria==''&&@e_min!='' &&@e_max!=''&&@zona=='')
            @cards=Card.where(energia: (@e_min.to_i)..(@e_max.to_i))
        end

        if (@categoria!=''&&@e_min=='' &&@e_max==''&&@zona!='')
            @cards=Card.where(categoria: @categoria, zona: @zona)
        end

        if (@categoria!=''&&@e_min!='' &&@e_max!=''&&@zona!='')
            @cards=Card.where(energia: (@e_min.to_i)..(@e_max.to_i),categoria: @categoria, zona: @zona)
        end
        
        if (@categoria==''&&@e_min!='' &&@e_max==''&&@zona=='')
            @cards=Card.where(energia: (@e_min.to_i)..(20000))
        end

        if (@categoria==''&&@e_min=='' &&@e_max!=''&&@zona=='')
            @cards=Card.where(energia: (0)..(@e_max.to_i))
        end

        if (@categoria!=''&&@e_min=='' &&@e_max==''&&@zona=='')
            @cards=Card.where(categoria: @categoria)
        end
        
        if (@categoria==''&&@e_min=='' &&@e_max==''&&@zona!='')
            @cards=Card.where( zona: @zona)
        end

        if (@categoria==''&&@e_min=='' &&@e_max==''&&@zona=='')
            @cards=Card.all
        end

    end


    def visualizzacard
        @card=Card.find(params[:id])
        @val=@card.interazioni
        @val=@val+1
        @card.interazioni=@val
        @card.save!
    end


    def ordina
        @cards=Card.order(:energia)
    end

    def ordinadesc
        @cards=Card.order(energia: :desc)
    end
end

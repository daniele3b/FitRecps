class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def destroy
        @recipe=Recipe.find(params[:id])
        @recipe.destroy

        redirect_to profiles_myrecipes_url
    end

    def create
        
        @nome = params[:Nome]

        @tipo = params[:Tipo]
        
        @arachidi_e_derivati = params[:Arachidi_e_derivati]
        @frutta_a_guscio = params[:Frutta_a_guscio]
        @latte_e_derivati = params[:Latte_e_derivati]
        @molluschi = params[:Molluschi]
        @pesce = params[:Pesce]
        @sesamo = params[:Sesamo]
        @soia = params[:Soia]
        @crostacei = params[:Crostacei]
        @glutine = params[:Glutine]
        @lupini = params[:Lupini]
        @senape = params[:Senape]
        @sedano = params[:Sedano]
        @anidride_solforosa_e_solfiti = params[:Anidride_solforosa_e_solfiti]
        @uova_e_derivati = params[:Uova_e_derivati]
        
        @ingredienti = params[:Ingredienti]
        
        @procedimento = params[:Procedimento]
       
        @energia = params[:Energia]
        @carboidrati = params[:Carboidrati]
        @grassi = params[:Grassi]
        @proteine = params[:Proteine]
        @fibre = params[:Fibre]
        @sodio = params[:Sodio]
        

        @video_tutorial = params[:Tutorial]
        
        @codice = SecureRandom.urlsafe_base64(50, false)

        @recipe = Recipe.create(:foto=>params[:Immagine], :codice=>@codice, :nome=>@nome, :tipo=>@tipo, :arachidi_e_derivati=>@arachidi_e_derivati,
            :frutta_a_guscio=>@frutta_a_guscio, :latte_e_derivati=>@latte_e_derivati, :molluschi=>@molluschi,
            :pesce=>@pesce, :sesamo=>@sesamo, :soia=>@soia, :crostacei=>@crostacei, :glutine=>@glutine,
            :lupini=>@lupini, :senape=>@senape, :sedano=>@sedano,
            :anidride_solforosa_e_solfiti=>@anidride_solforosa_e_solfiti, :uova_e_derivati=>@uova_e_derivati,
            :ingredienti=>@ingredienti, :procedimento=>@procedimento, :energia=>@energia, :carboidrati=>@carboidrati,
            :grassi=>@grassi, :proteine=>@proteine, :fibre=>@fibre, :sodio=>@sodio, :video_tutorial=>@video_tutorial,
            :user_id=>current_user.id)
        
        @recipe.save!
        redirect_to recipes_url
    end

    def new
    
    end 

    def show
        @recipe = Recipe.find(params[:id])
    end

    def edit
        @recipe=Recipe.find(params[:id])

        puts(@recipe.procedimento) 
    end

    def update

        @tipo = params[:tipo]
        @foto = params[:immagine]
        
        @arachidi_e_derivati = params[:arachidi_e_derivati]
        @frutta_a_guscio = params[:frutta_a_guscio]
        @latte_e_derivati = params[:latte_e_derivati]
        @molluschi = params[:molluschi]
        @pesce = params[:pesce]
        @sesamo = params[:sesamo]
        @soia = params[:soia]
        @crostacei = params[:crostacei]
        @glutine = params[:glutine]
        @lupini = params[:lupini]
        @senape = params[:senape]
        @sedano = params[:sedano]
        @anidride_solforosa_e_solfiti = params[:anidride_solforosa_e_solfiti]
        @uova_e_derivati = params[:uova_e_derivati]
        
        @ingredienti = params[:ingredienti]
        
        @procedimento = params[:procedimento]
       
        @energia = params[:energia]
        @carboidrati = params[:carboidrati]
        @grassi = params[:grassi]
        @proteine = params[:proteine]
        @fibre = params[:fibre]
        @sodio = params[:sodio] 
        

        @video_tutorial = params[:videp_tutorial] 

        @recipe=Recipe.find(params[:id])

        @recipe.update_attributes!(params[:recipe].permit(:nome,:tipo, :foto, :arachidi_e_derivati, :frutta_a_guscio, :latte_e_derivati,
        :molluschi, :pesce, :sesamo, :soia, :crostacei, :glutine, :lupini, :senape, :sedano, :anidride_solforosa_e_solfiti,
        :uova_e_derivati, :ingredienti, :procedimento, :energia, :carboidrati, :grassi, :proteine, :fibre, :sodio,
        :video_tutorial))

        redirect_to profiles_myrecipes_url
    end

end

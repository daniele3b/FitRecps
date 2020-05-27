class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
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
        #if recipe.arachidi_e_derivati == 1 recipe.arachidi_e_derivati = "SI'"
        #else recipe.arachidi_e_derivati = "NO"
        #end

        #if (@recipe.frutta_a_guscio == 1) @recipe.frutta_a_guscio = "SI'"
        #else @recipe.frutta_a_guscio = "NO"
        #end

        #if (@recipe.latte_e_derivati == 1) @recipe.latte_e_derivati = "SI'"
        #else @recipe.latte_e_derivati = "NO"
        #end

        #if (@recipe.molluschi == 1) @recipe.molluschi = "SI'"
        #else @recipe.molluschi = "NO"
        #end

        #if (@recipe.pesce == 1) @recipe.pesce = "SI'"
        #else @recipe.pesce = "NO"
        #end

        #if @recipe.sesamo == 1 @recipe.sesamo = "SI'"
        #else @recipe.sesamo = "NO"
        #end

    end
end

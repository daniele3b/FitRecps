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

    def filter
        puts('FILTER!')
    end
    
    def visualizza
        @tipo = params[:tipo]

        @carboidrati_min = params[:carboidrati_min]
        @carboidrati_max = params[:carboidrati_max]
        @grassi_min = params[:grassi_min]
        @grassi_max = params[:grassi_max]
        @proteine_min = params[:proteine_min]
        @proteine_max = params[:proteine_max]

        puts(@tipo)
        puts(@carboidrati_min)
        puts(@carboidrati_max)
        puts(@grassi_min)
        puts(@grassi_max)
        puts(@proteine_min)
        puts(@proteine_max)
        
        #FILTRI CON 1 PARAMETRO
        
        #Solo tipo
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo)
        end

        #Solo carboidrati_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000))
        end

        #Solo carboidrati_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i))
        end

        #Solo grassi_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@grassi_min.to_i)..(20000))
        end

        #Solo grassi_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@grassi_max.to_i))
        end

        #Solo proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@proteine_min.to_i)..(20000))
        end

        #Solo proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@proteine_max.to_i))
        end
        
        
        #FILTRI CON 2 PARAMETRI

        
        #tipo + carboidrati_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000))
        end

        #tipo + carboidrati_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i))
        end

        #tipo + grassi_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi.to_i)..(20000))
        end

        #tipo + grassi_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (0)..(@grassi_max.to_i) )
        end

        #tipo + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, Proteine: (0)..(@proteine_max.to_i) )
        end

        #carboidrati_min + carboidrati_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i))
        end

        #carboidrati_min + grassi_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(20000))
        end

        #carboidrati_min + grassi_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (0)..(@grassi_max.to_i))
        end

        #carboidrati_min + proteine_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_max + grassi_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000))
        end

        #carboidrati_max + grassi_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i))
        end

        #carboidrati_max + proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_max + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #grassi_min + grassi_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(grassi: (@grassi_min.to_i)..(@grassi_max.to_i))
        end

        #grassi_min + proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #grassi_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #grassi_max + proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #grassi_max + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(grassi: (0)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end



        #FILTRI CON 3 PARAMETRI

        #tipo + carboidrati_min + carboidrati_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i))
        end

        #tipo + carboidrati_min + grassi_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + grassi_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (0)..(@grassi_max.to_i))
        end

        #tipo + carboidrati_min + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_max + grassi_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000))
        end

        #tipo + carboidrati_max + grassi_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i))
        end

        #tipo + carboidrati_max + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_max + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + grassi_min + grassi_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi_min.to_i)..(grassi_max.to_i))
        end

        #tipo + grassi_min + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + grassi_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (0)..(grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (0)..(grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #carboidrati_min + carboidrati_max + grassi_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000))
        end

        #carboidrati_min + carboidrati_max + grassi_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i))
        end

        #carboidrati_min + carboidrati_max + proteine_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_min + carboidrati_max + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_min + grassi_min + grassi_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(@grassi_max.to_i))
        end

        #carboidrati_min + grassi_min + proteine_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_min + grassi_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_min + grassi_max + proteine_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_min + grassi_max + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (0)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_min + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), proteine: (@proteine_max.to_i)..(@proteine_max.to_i))
        end

        #carboidrati_max + grassi_min + grassi_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i))
        end

        #carboidrati_max + grassi_min + proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_max + grassi_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_max + grassi_max + proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_max + grassi_max + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_max + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #grassi_min + grassi_max + proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #grassi_min + grassi_max + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #grassi_min + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #grassi_max + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end



        #FILTRI CON 4 PARAMETRI
        
        #tipo + carboidrati_min + carboidrati_max + grassi_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + carboidrati_max + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + grassi_min + grassi_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(@grassi_max.to_i))
        end

        #tipo + carboidrati_min + grassi_min + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + grassi_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (0)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_max + grassi_min + grassi_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i))
        end

        #tipo + carboidrati_max + grassi_min + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_max + grassi_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_max + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_max + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + grassi_min + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + grassi_min + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + grassi_min + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + grassi_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #carboidrati_min + carboidrati_max + grassi_min + grassi_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i))
        end

        #carboidrati_min + carboidrati_max + grassi_min + proteine_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_min + carboidrati_max + grassi_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_min + carboidrati_max + grassi_max + proteine_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_min + carboidrati_max + grassi_max + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_min + carboidrati_max + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #carboidrati_max + grassi_min + grassi_max + proteine_min
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_max + grassi_min + grassi_max + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_max + grassi_min + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end
        
        #grassi_min + grassi_max + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end


        
        #FILTRI CON 5 PARAMETRI

        #tipo + carboidrati_min + carboidrati_max + grassi_min + grassi_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_min + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + grassi_min + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_min + grassi_min + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + grassi_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_max + grassi_min + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #tipo + carboidrati_max + grassi_min + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + grassi_min + grassi_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #carboidrati_min + carboidrati_max + grassi_min + grassi_max + proteine_min
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        #carboidrati_min + carboidrati_max + grassi_min + grassi_max + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #carboidrati_min + carboidrati_max + grassi_min + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #carboidrati_min + grassi_min + grassi_max + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #carboidrati_max + grassi_min + grassi_max + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end


        #FILTRI CON 6 PARAMETRI

        #carboidrati_min + carboidrati_max + grassi_min + grassi_max + proteine_min + proteine_max
        if (@tipo == '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end
        
        #tipo + carboidrati_max + grassi_min + grassi_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min == '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (0)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + grassi_min + grassi_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max == '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(20000), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_max + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min == '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (0)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_min + proteine_min + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max == '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(20000), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_min + grassi_max + proteine_max
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (0)..(@proteine_max.to_i))
        end

        #tipo + carboidrati_min + carboidrati_max + grassi_min + grassi_max + proteine_min
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max == '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(20000))
        end

        
        
        #FILTRI CON TUTTI I PARAMETRI
        if (@tipo != '' && @carboidrati_min != '' && @carboidrati_max != '' && @grassi_min != '' && @grassi_max != '' && @proteine_min != '' && @proteine_max != '')
            @recipes = Recipe.where(tipo: @tipo, carboidrati: (@carboidrati_min.to_i)..(@carboidrati_max.to_i), grassi: (@grassi_min.to_i)..(@grassi_max.to_i), proteine: (@proteine_min.to_i)..(@proteine_max.to_i))
        end



        #NESSUN FILTRO
        if (@tipo == '' && @carboidrati_min == '' && @carboidrati_max == '' && @grassi_min == '' && @grassi_max == '' && @proteine_min == '' && @proteine_max == '')
            @recipes = Recipe.all  
        end

    end

end

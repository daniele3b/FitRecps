class RatingsController < ApplicationController
    
    def exist
       
        
        if(Rating.where(recipe_id: params[:id],user_id: current_user.id).length==0)
            redirect_to new_rating_path(recipeid: params[:id])
        else
            redirect_to edit_rating_path(recipeid:params[:id])
        end

    end


    
    def destroy
        @recipeid = params[:id]
        
        @rat = Rating.where(recipe_id:@recipeid,user_id:current_user.id)
        
        @rat[0].destroy

        redirect_to recipes_url
    end

    def create
   
      @recipeid = params[:recipeid]

      @rating = Rating.new(:valore=>params[:valore],:recipe_id=>@recipeid,:user_id=>current_user.id)
      @rating.save!
      redirect_to recipes_url
    end

    def new
        @recipeid = params[:recipeid]
    end 


    def edit
        @recipeid = params[:recipeid]

        @rat = Rating.where(recipe_id:@recipeid,user_id:current_user.id)


        @r = @rat[0]
  
      
    end

    def update
        @recipeid = params[:recipeid]
        puts(@r)
    
        @rat = Rating.where(recipe_id:@recipeid, user_id:current_user.id)

        @rat[0].destroy

        @rating = Rating.create(:valore=>params[:valore],:recipe_id=>@recipeid,:user_id=>current_user.id)
        @rating.save!

        redirect_to recipes_url
    end

end

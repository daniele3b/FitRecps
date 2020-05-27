class ReviewsController < ApplicationController

    def exist
        puts(params[:id])

        if(Review.where(card_id: params[:id],user_id: current_user.id))
            redirect_to new_review_path
        else
            redirect_to edit_review
        end

    end


    
    def destroy
    

        redirect_to profiles_mycards_url
    end

    def create
        render html:'porco'
    end

    def new
        render html:'porco'
    end 


    def edit
        render html:'dio'
      
    end
end

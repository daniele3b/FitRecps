class ReviewsController < ApplicationController

    def exist
       
        
        if(Review.where(cards: params[:id],users: current_user.id).length==0)
            redirect_to new_review_path(cid: params[:id])
        else
            redirect_to edit_review_path
        end

    end


    
    def destroy
        redirect_to profiles_mycards_url
    end

    def create
   
      @s=params[:s]

      @review=Review.create(:valore=>params[:valore],:cards=>@s,:users=>current_user.id)
      @review.save!
      redirect_to cards_url
    end

    def new
        @c=params[:cid]
    end 


    def edit
        render html:'dio'
      
    end
end

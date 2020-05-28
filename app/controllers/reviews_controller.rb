class ReviewsController < ApplicationController

    def exist
       
        
        if(Review.where(cards: params[:id],users: current_user.id).length==0)
            redirect_to new_review_path(cid: params[:id])
        else
            redirect_to edit_review_path(cid:params[:id])
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
        @c=params[:cid]

        @rev=Review.where(cards:@c,users:current_user.id)

        @r=@rev[0]
  
      
    end

    def update
        @s=params[:s]
        puts(@r)
    
        @rev=Review.where(cards:@s,users:current_user.id)

        @rev[0].destroy
        
        @review=Review.create(:valore=>params[:valore],:cards=>@s,:users=>current_user.id)
        @review.save!

        redirect_to cards_url
    end
end

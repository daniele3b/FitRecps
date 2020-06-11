class ReviewsController < ApplicationController

    def exist
       
        
        if(Review.where(card_id: params[:id],user_id: current_user.id).length==0)
            redirect_to new_review_path(cid: params[:id])
        else
            redirect_to edit_review_path(cid:params[:id])
        end

    end


    
    def destroy
        @c=params[:id]
        
        @rev=Review.where(card_id:@c,user_id:current_user.id)
        
        @rev[0].destroy

        redirect_to cards_url
    end

    def create
   
      @s=params[:s]
     
      @card=Card.find( @s)
      @review=Review.new(:valore=>params[:valore],:card_id=>@card.id,:user_id=>current_user.id)
      @review.save!
      redirect_to cards_url
    end

    def new
        @c=params[:cid]
    end 


    def edit
        @c=params[:cid]

        @rev=Review.where(card_id:@c,user_id:current_user.id)


        @r=@rev[0]
  
      
    end

    def update
        @s=params[:s]
    
    
        @rev=Review.where(card_id:@s,user_id:current_user.id)

        @rev[0].destroy

        @review=Review.create(:valore=>params[:valore],:card_id=>@s,:user_id=>current_user.id)
        @review.save!

        redirect_to cards_url
    end
end

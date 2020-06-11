class ProfilesController < ApplicationController

    def mycards
        @cards=Card.where(:user_id=>current_user.id)
    end

    def myrecipes
        @recipes = Recipe.where(:user_id=>current_user.id)
    end

    def analisicard
        @cards=Card.all


        @b=Card.group(:categoria).sum(:interazioni)
    end

    def analisirecipe

        @recipes = Recipe.all


        @b=Recipe.group(:tipo).sum(:interazioni)

    end 

    def avatar
    
    end
end

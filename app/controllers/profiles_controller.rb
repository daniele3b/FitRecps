class ProfilesController < ApplicationController

    def mycards
        @cards=Card.where(:user_id=>current_user.id)
    end
end

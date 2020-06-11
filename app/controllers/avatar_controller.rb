class AvatarController < ApplicationController
    #attr_accessible :avatar
    mount_uploader :avatar, AvatarUploader
    
    def index
    
    end

    def modifica
        @user = current_user.email
    end
end

class AvatarController < ApplicationController
    #attr_accessible :avatar
    #mount_uploader :avatar, AvatarUploader
    
    def index
        @users = User.all
    end


    def modifica
        @user = User.find_by(:id => current_user.id)
        @urlavatar = params[:avatar]
        @user.avatar = @urlavatar
        @user.save
        redirect_to '/profiles/myprofile'
    end

    def leva
        @user = User.find_by(:email => current_user.email)
        @user.avatar = ''
        @user.save
        redirect_to '/profiles/myprofile'
    end
end

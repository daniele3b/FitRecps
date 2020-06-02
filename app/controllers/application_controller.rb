class ApplicationController < ActionController::Base
     before_action :authenticate_user!

     #Se vuoi levare autorizzazioni commenta le cose qui sotto
     #helper_method: current_user
     #
     #def current_user
     #   current_moviegoer
     #end
     rescue_from CanCan::AccessDenied do |exception|
          redirect_to root_path, :alert=> exception.message
     end
end 

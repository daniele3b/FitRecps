class ApplicationController < ActionController::Base
     before_action :authenticate_user!

     #before_action :configure_sign_in_params, only: [:create]
     before_action :configure_sign_in_params, if: :devise_controller?

     def configure_sign_in_params
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome, :cognome, :luogoNascita, :dataNascita, :sesso, :email, :password, :cf, :avatar) }
     end

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

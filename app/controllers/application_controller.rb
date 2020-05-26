class ApplicationController < ActionController::Base
     before_action :authenticate_user!
     before_action :configure_permitted_parameters, :only => [:create]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome, :cognome, :luogoNascita, :dataNascita, :sesso, :email, :password) }
    end
end 

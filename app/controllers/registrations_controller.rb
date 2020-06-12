class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_in_params, only: [:create]

    protected

   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome, :cognome, :luogoNascita, :dataNascita, :sesso, :email, :password, :cf, :avatar) }
   end


  
  end 
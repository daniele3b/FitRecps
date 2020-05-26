Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cards
  resources :recipes

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

  def after_sign_in_path_for(resource_or_scope)
    
  end
  
  def after_sign_out_path_for(resource_or_scope)
   
  end
   
end

Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cards
  
  resources :recipes

  resources :reviews

  get 'finestra/:id', :to=> 'cards#visualizzacard'
  get 'profiles/mycards', :to => 'profiles#mycards'
  get 'profiles/myrecipes', :to => 'profiles#myrecipes'

  get 'profiles/analisi/cards', :to => 'profiles#analisicard'

  get 'cards/filter/scelta', :to => 'cards#filter'


  get 'cards/ordina/energia', :to=> 'cards#ordina'

  get 'cards/ordina/energia/desc', :to=> 'cards#ordinadesc'


  get 'cards/filter/scelta/visualizza', :to => 'cards#visualizza'
  

  get 'recipes/filter/scelta', :to => 'recipes#filter'
  get 'recipes/filter/scelta/visualizza', :to => 'recipes#visualizza'
   

 root 'cards#index'
   
end

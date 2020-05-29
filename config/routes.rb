Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cards
  
  resources :recipes

  resources :reviews
  get 'reviews/exist/:id', :to=> 'reviews#exist'
  get 'finestra/:id', :to=> 'cards#visualizzacard'
  get 'profiles/mycards', :to => 'profiles#mycards'
  get 'profiles/myrecipes', :to => 'profiles#myrecipes'

  get 'profiles/myprofile', :to => 'profiles#myprofile'

  get 'profiles/analisi/cards', :to => 'profiles#analisicard'

  get 'cards/filter/scelta', :to => 'cards#filter'


  


  get 'cards/ordina/energia', :to=> 'cards#ordina'

  get 'cards/ordina/energia/desc', :to=> 'cards#ordinadesc'


  get 'cards/filter/scelta/visualizza', :to => 'cards#visualizza'
  

  get 'recipes/filter/scelta', :to => 'recipes#filter'
  get 'recipes/filter/scelta/visualizza', :to => 'recipes#visualizza'

  get 'recipes/filter/scelta/visualizzarecipe', :to => 'recipes#visualizzarecipe'
  
  get 'recipes/ordina/energia', :to=> 'recipes#ordina'

  get 'recipes/ordina/energia/desc', :to=> 'recipes#ordinadesc'

  get 'profiles/analisi/recipes', :to => 'profiles#analisirecipe'

  get 'recipes/filter/nome', :to => 'recipes#ricettefiltratenome'

 root 'cards#index'
   
end

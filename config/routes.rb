Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
  #:controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cards
  
  resources :recipes

  resources :reviews

  resources :ratings


  get 'reviews/exist/:id', :to=> 'reviews#exist'
  get 'finestra/:id', :to=> 'cards#visualizzacard'
  get 'profiles/mycards', :to => 'profiles#mycards'
  get 'profiles/myrecipes', :to => 'profiles#myrecipes'

  get 'profiles/myprofile', :to => 'profiles#myprofile'
  get 'profiles/infosviluppatori', :to => 'profiles#infosviluppatori'
  get 'profiles/modificainfo', :to => 'profiles#modificainfo'
  
  get 'profiles/aggimp', :to => 'profiles#aggimp'
  get 'profiles/rimimp', :to => 'profiles#rimimp'
  get 'profiles/listimp', :to => 'profiles#listimp'
  get 'profiles/bannauser', :to => 'profiles#bannauser'
  get 'profiles/success', :to => 'profiles#success'
  get 'profiles/avatar', :to => "profiles#avatar"

  post 'profiles/aggimp' => "aggimp#aggiungi"
  post 'profiles/rimimp' => "aggimp#rimuovi"
  post 'profiles/bannauser' => "aggimp#banna"
  post 'profiles/listimp' => "aggimp#rimuovispecificato"
  post 'profiles/avatar' => "avatar#modifica"
  post 'profiles/modificainfo' => "aggimp#modificainfo"
  delete 'profiles/avatar' => "avatar#leva"

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

  get 'ratings/exist/:id', :to=> 'ratings#exist'

 root 'cards#index'
   
end

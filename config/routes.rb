Rails.application.routes.draw do
 
  

  resources :games
  root 'games#index'

  #match '/attack' => 'games#attack'

end

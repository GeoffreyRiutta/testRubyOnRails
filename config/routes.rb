Rails.application.routes.draw do
  root 'games#index'
  resources :games do   
    get 'attack'
  end  

end

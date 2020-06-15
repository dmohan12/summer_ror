Rails.application.routes.draw do
  devise_for :users
  resources :items

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  

  get '/items/:id/complete', to: "items#complete", as: 'item_complete'

  get '/items/:id/incomplete', to: 'items#incomplete', as: 'item_incomplete'

  #showing static pages, like login screen
  get "/:page" => "static#show"



end

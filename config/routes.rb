Rails.application.routes.draw do 

 resources :pubs, only: [:new, :create, :index] #created new New Array
 root 'pubs#index'

end

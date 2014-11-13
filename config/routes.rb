Rails.application.routes.draw do 

 resources :pubs, only: [:new, :create, :index]
end

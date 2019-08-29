Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # custom route - get 'where it is going' -get 'controller#action'
  # root 'controller#action' the main/ root page, localhost:3000 /
  root 'subs#index'
            #name of controller
  resources :subs do
    resources :topics
  end
end

# resources :comments
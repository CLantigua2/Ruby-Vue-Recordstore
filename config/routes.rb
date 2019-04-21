Rails.application.routes.draw do
  resources :records
  resources :artists
  namespace :api do
    namespace :v1 do
            end
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

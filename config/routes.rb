Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"

  get "/mypage", to: "pages#mypage", as: :mypage
  get "/about", to: "pages#about", as: :about
  get "/likes", to: "likes#index", as: :likes

  resources :photos, only: :show, param: :slug
  resources :users, only: :show, param: :slug

  get "/404", to: "errors#not_found", as: :not_found
  match "*unmatched", to: "errors#not_found", via: :all
end

Rails.application.routes.draw do

  devise_for :users

  resource :user

  resources :events

  namespace :admin do
    root "events#index"
    resources :events
    resources :categories
    resources :users
  end

  get "/faq" => "pages#faq"

  root "events#index"

end

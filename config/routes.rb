Rails.application.routes.draw do
  resources :contact_requests, only: [:create]

  root "pages#home"
end

Rails.application.routes.draw do
  resources :books do
    resources :borrowings, only: [:create, :update]  
  end

  root "books#index"
end

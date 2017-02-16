Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :motorbikes do
    patch  "rentals/:id", to: "rentals#accept", as: :confirm_booking
    put  "rentals/:id", to: "rentals#decline", as: :decline_booking
    resources :rentals, only: [:index, :create, :show]
  end
  resources :users, only: [:show, :edit, :update]
  post "rentals/:rental_id/reviews", to: "reviews#create", as: :create_review

end

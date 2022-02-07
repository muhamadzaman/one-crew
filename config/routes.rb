Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :jobs do
    resources :estimates do
      resources :estimate_details
    end
  end

  resources :users, only: [:index, :show, :update]
end

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :jobs do
        resources :estimates
      end

      resources :users, only: [:index, :show, :update]
    end
  end
end

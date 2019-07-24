Rails.application.routes.draw do
  root to: 'repositories#index'

  resources :repositories, only: :index do
    collection do
      post :update_data
    end
  end
end

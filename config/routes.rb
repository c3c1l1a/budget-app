Rails.application.routes.draw do
  resources :details
  resources :expenses, only: %i[index show create new destroy] 

  
  resources :home, only: %i[index]
  devise_for :users, path: '/', path_names: {
    sign_in: 'login'
  }, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root "expenses#index", as: :authenticated_root
  end

  # Defines the root path route ("/")
  root "home#index"
end

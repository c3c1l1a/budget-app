Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, path: '/', path_names: {
    sign_in: 'login'
  }, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

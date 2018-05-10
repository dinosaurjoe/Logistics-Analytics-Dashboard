Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {sessions: 'users/sessions'}
  devise_for :customers, path: 'customers', controllers: {sessions: 'customers/sessions'}

  get 'dashboard/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index", as: 'dashboard'
end

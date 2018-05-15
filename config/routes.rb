Rails.application.routes.draw do

  devise_for :users, path: 'users', controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}


  get 'dashboard/index'
  resources :users do
    resources :requests do
      collection do
       get 'declined'
       get 'accepted'
       get 'pending'
      end

      resources :freight_capacities
    end
  end

  resources :shops do
    get 'destination'
    get 'origin'
    get 'shipmentsgraph'

      resources :shipments do
        collection  do
          get 'complete'
          get 'open'
          get 'received'
          get 'air'
          get 'ocean'
          get 'rail'
        end

        resources :freight_capacities
      end
      devise_for :customers, path: 'customers', controllers: {sessions: 'customers/sessions', registrations: 'customers/registrations'}
      resources :customers, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index", as: 'dashboard'
end

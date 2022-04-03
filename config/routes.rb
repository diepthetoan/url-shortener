Rails.application.routes.draw do
  default_url_options host: 'localhost:3000'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    member do
      get :links
      get :new_link
      patch :links
      post :create_link
      delete :delete_link
    end

    get '/links/:link_id', to: 'users#link', as: :link
    post '/links/:link_id', to: 'users#update_link', as: :update_link
  end

  get '/short/:slug', to: 'links#show', as: :short
end

Rails.application.routes.draw do
  root 'sessions#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :step_records, only: [:index, :new, :create, :update] do
    collection do
      get :edit
    end
  end
end

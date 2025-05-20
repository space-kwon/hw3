Rails.application.routes.draw do
  get 'entries/new'
  get 'entries/create'
  get 'places/index'
  get 'places/show'
  get 'places/new'
  get 'places/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get("/", { :controller => "articles", :action => "index" })
  # Set the root route to the list of places
  root "places#index"

  resources :places, only: [:index, :show, :new, :create] do
    resources :entries, only: [:new, :create] # Nested under places
  end
end

Rails.application.routes.draw do
  devise_for :users #toujours devant
  resources :products do
    collection do 
      post "augmenter_prix"
    end
  end
  #ou post '/augmenter_prix', to: 'products#augmenter_prix', as: 'augmenter_prix'

  resources :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

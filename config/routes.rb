Rails.application.routes.draw do
  resources :manufactures do
    resources :categories do
      resources :accessories

      resources :products do
        resource :configuration

        # member do
        #   get :hide
        # end

        # collection do
        #   get :block
        # end
      end
    end
  end

  resources :categories do
    resources :products
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
end

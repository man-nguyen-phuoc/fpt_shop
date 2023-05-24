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
    resources :accessories
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"

  resources :homes do
    collection do
      get 'search'
      get 'payment'
    end
  end

  resources :orders

  resources :order_details do
    collection do
      post 'filter'
    end
  end

  resources :order_detail_items

  resources :carts

  resources :users do
    resources :orders

    collection do
      get 'login'
    end
  end

end

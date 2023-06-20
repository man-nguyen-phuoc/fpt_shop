Rails.application.routes.draw do
  resources :manufactures do
    resources :categories do
      resources :accessories

      resources :products do
        resource :configuration
      end
    end
  end

  resources :categories do
    resources :products
    resources :accessories
  end

  root "homes#index"

  resources :homes do
    collection do
      get 'search'
      get 'payment'
    end
  end

  resources :orders do
    collection do
      get 'placed'
    end
  end

  resources :order_details do
    collection do
      get 'coupon'
    end
  end

  resources :order_detail_items

  resources :carts

  resources :coupons

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users do
    resources :carts do
      collection do
        post 'filter'
      end
    end
  end
end

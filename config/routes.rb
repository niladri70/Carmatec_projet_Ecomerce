Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'shops/index'
  get 'admin/index'
  
  resources :categories, only: [:index,:show] 
  resources :addresses
  resources :checkout do
    collection do
      get "order_all"
      post "place_order"
    end
  end
  resources :reviews
  resources :shops do 
    collection do
      get "product"
      get "cart"
      get "proceed"
      get "wishlist"
      get :ajax_add
      get :ajax_wish
      get "single_product"
    end
  end
  namespace :admin do
    
    resources :dashboard
    resources :products
    resources :orders
    resources :categories
    resources :roles
    resources :users
  end
  resources :cart do
   post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'
  end

  devise_for :users 
  devise_scope :user do
    get 'users/sign_in' => 'devise/sessions#new'
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  resources :user, only: [:show]
    match 'users/show', to: 'users#show', via: 'get'
resources :orders

 get 'users/index'
 root 'shops#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

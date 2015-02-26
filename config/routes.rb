Rails.application.routes.draw do

  match 'driver_bookings' => 'requests', :via => :get
  match 'passenger_bookings' => 'requests', :via => :get
  match 'conversations/inbox' => 'conversations#inbox', :via => :get
  match 'conversations/sent' => 'conversations#sent', :via => :get
  match 'conversations/trash' => 'conversations#trash', :via => :get

  get 'empty_trash', to: 'conversations#empty_trash'


  resources :requests do
    get 'driver_bookings', on: :member
    get 'passenger_bookings', on: :member
  end

  resources :conversations, only: [:index, :show, :new, :create, :inbox, :sent, :trash] do
    member do
      post :reply
      post :trash
      post :untrash
      post :erase
      get :inbox
      get :mark_as_read
      get :mark_as_unread
      get :trash_message
      get :new_message
    end
  end

  resources :messages, only: [:index, :show, :new, :create] do
    member do
      post :trash
      post :untrash
      post :erase
      post :mark_as_read
      post :mark_as_unread
      get :reply
    end
  end
        
  devise_for :users

  resources :rides do
    patch 'accept', on: :member
  end  

  root to: "rides#index"

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

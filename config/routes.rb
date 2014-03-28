Timothyproffitt::Application.routes.draw do
  
  get "casham/one_col"
  root 'static_pages#home'
  resources :sessions, only: [:new, :create, :destroy]

  resources :users
  
  match "/", to: "static_pages#home", via: "get"
  match "/signup", to: "users#new", via: "get"
  match "/signin", to: "sessions#new", via: "get"
  #match "/signout", to: "sessions#destroy", via: "delete"
  match '/signout', :to => 'sessions#destroy', via: :delete
  get "static_pages/help"
  get "static_pages/about"

  get "casham/index"
  get "casham/article_module"
  get "casham/store_search_page"
  get "casham/style_guide"
  get "casham/template_tcc"
  get "casham/template_occ"
  get "casham/demo"
  get "cadsham/services_template"
  

  get "caredes/index"
  get "caredes/test"
  get "caredes/pawn_loans"
  get "caredes/auto_loans"
  get "caredes/advanced_store_search"
  get "caredes/auto_application"
  get "caredes/auto_application2"
  get "caredes/cash_advances"
  get "caredes/faq"
  get "caredes/terms"
  get "caredes/retail_services"
  get "caredes/caredes_tcc"
  get "caredes/caredes_occ"
  

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

Fablebox::Application.routes.draw do
  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get   'api/notification/new'                   =>    'api/notification#new'
  get   'api/notification/new_fable/:id'         =>    'api/notification#fable_added'
  get   'api/notification/new_fable/:id'         =>    'api/notification#fable_added2'
  get   'api/fable/list'                         =>    'api/fable#list'
  get   'api/fable/audio/:guid'                  =>    'api/fable#audio'
  get   'api/fable/image/small/:guid'            =>    'api/fable#image_small'
  get   'api/fable/image.large/:guid'            =>    'api/fable#image_large'
  post  'api/user/register'                      =>    'api/user#register'
  get   'api/user/purchase_fable'                =>    'api/user#purchase'

  resources :fables
  resources :users

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

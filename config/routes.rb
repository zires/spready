Spready::Application.routes.draw do

  root :to => 'spready/welcome#index'

  namespace :admin do

    namespace :spready do
      resources :forums
    end

  end

  # namespace :spready do

  #   namespace :admin do
  #     resources :forums
  #   end

  #   resources :forums

  # end

  # match '/install' => 'admin/site#install', :as => :install
  # match '/install/done' => 'admin/site#done', :as => :install_done, :via => :post

  # #devise_for :users
  
  # resources :forums

  # namespace :admin, :path => 'sp-admin' do
  #   root :to => 'dashboard#index'
    
  #   resources :forums do

  #     resources :categories do
  #       resources :topics do
  #         resources :comments
  #       end
  #     end

  #     member do
  #       get 'details'
  #     end

  #   end

  #   resources :users, :forums
  #   #resource  :site, :only => [ :show, :edit, :update ], :controller => 'site'
  # end

  # # Site
  # match 'sp-admin/site/edit' => 'admin/site#edit'
  # match 'sp-admin/site' => 'admin/site#show'
  # match 'sp-admin/site/update' => 'admin/site#update', :as => :update_site, :via => :put

  # match ':forum_id/:id' => 'categories#show', :as => :category
  # match ':forum_id/:id/topic/new' => 'topics#new', :as => :new_topic
  # match ':forum_id/:id/topic/create' => 'topics#create', :as => :create_topic, :via => :post
  # match ':forum_id/:category_id/topic/:id' => 'topics#show', :as => :topic
  # match ':forum_id/:category_id/topic/:id/comments/new' => 'comments#new', :as => :new_comment
  # match ':forum_id/:category_id/topic/:id/comments/create' => 'comments#create', :as => :create_comment, :via => :post
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

Spready::Engine.routes.draw do
  
  root :to => 'welcome#index'

  devise_for :users, :module => "devise", :class_name => 'User' if Spready.use_devise?

  namespace :admin do

    resources :forums
    resources :topics
    resources :categories

  end

  resources :forums
  resources :topics
  resources :categories

end

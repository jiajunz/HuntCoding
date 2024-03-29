Jjywebsite::Application.routes.draw do
  devise_for :admin_users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
 
  devise_scope :admin_user do
      post "sessions/admin_user" => "devise/sessions#create"
  end

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

  root 'common_pages#welcome'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :problems, only: [:index, :show, :new, :create,:destroy]
  resources :submissions, only: [:new, :create, :show, :index]
  get "common_pages/welcome"
  get "common_pages/home"
  get '/release', to: 'common_pages#release'
  match '/signup', to: 'users#new', via:'get'
  match '/signin', to: 'sessions#new', via:'get'
  match '/signout', to: 'sessions#destroy', via:'delete'
  match '/submissions/new/:id', to: 'submissions#new', via:'get', as: :newsub
  match '/submissions/:id', to: 'submissions#create', via: 'post'
  match '/mysubmission/:id', to: 'submissions#showmysub', via:'get', as: :mysub
  match '/judgesubmission', to: 'submissions#judgesubmission', via:'post'
  get   '/submission/', to: 'submissions#showuser', as: :subuser

  
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

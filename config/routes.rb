Ipadapp::Application.routes.draw do

  resources :push_notifications do
    collection do
      post :register_device
      post :update_notif
      post :remove_device
    end
  end


  resources :locations


  resources :schedules


  resources :meetings do
    collection do
      get 'my_meetings'=> :get_my_meetings
      get 'meetings_by_staff' => :get_meetings_by_staff
    end
  end


  resources :clients do
    collection do
      post 'new_client'=>'clients#create'
      get 'my_client'=>'clients#get_my_client'
      get 'clients_by_staff' => :get_all_clients_by_user
      get 'search_clients' => :search_all_clients
      get 'search_myclients' => :search_my_clients
      get 'search_clients_bystaff' =>:search_clients_by_staff
    end
  end


  resources :posts do
    collection do
      delete :destroy_multiple
    end
  end


  #get "home/index"

  devise_for :user,:path_prefix => 'd',:controllers => { :registrations => "registrations" }
  #devise_for :users,:path_prefix => 'd', :skip => [:registrations]
  #as :user do
  #  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #  put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
  #end
  #resource :users
  devise_scope :user do
    post 'login' => 'sessions#create', :as => 'login'
    delete 'logout' => 'sessions#destroy', :as => 'logout'
  end

  resources :users
  root :to => "home#index"

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

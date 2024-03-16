# require 'sidekiq/web'
Rails.application.routes.draw do

  namespace "api" do 
    namespace "v1" do 
       devise_for :users, default: {format: :json } , controllers: {
        sessions: 'api/v1/users/sessions' , registrations: 'api/v1/users/registrations' }
        namespace :users do 

        resource :profile , :only => [:show]
        end
        resources :products do 
          collection do 
            post :login 
          end 
        end 
        resources :cart_items
        resources :home 
        resources :order_items
        resources :variants
        
        resources :addresses do
          collection do
            get :select_address
          end
          
        end



    end
  end 

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

   # mount Sidekiq::Web => '/sidekiq'

  devise_for :users, :path => "users", controllers: {
        sessions: 'users/sessions'}

  resources :users do
    resources :addresses do
      collection do
        get :select_address
      end
    end
  end
# mount Sidekiq::Web => '/sidekiq'
root to: "products#index"  
resources :products 
resources :carts
resources :variants
resources :cart_items
resources :order_items
resources :payments
resources :home

# resources :addresses do
#   collection do
#     get :select_address
#   end
  
# end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

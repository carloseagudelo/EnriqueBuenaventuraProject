Rails.application.routes.draw do

  devise_for :users

  get 'welcome/index'
  get 'welcome_root/index'
  get 'document/list'
  get 'students/indexN'

  resources :document do
    resources :article
    get 'document/doc'
  end

  resources :students
  resources :glosary
  resources :authors_worked
  resources :books_worked
  resources :chronology
  resources :prose
  resources :subtopic
  resources :speciality
  resources :photos

  devise_scope :user do
    authenticated do
      authenticated :user, ->(u) { u.has_role?(:admin) } do
        root to: "welcome_root#index", as: :manager_root
      end

      authenticated :user, ->(u) { u.has_role?(:user) } do
        root to: "welcome#indexUser", as: :user
      end

      authenticated :user, ->(u) { u.has_role?(:student) } do
        root to: "welcome#index", as: :employee_root
      end
    end
    unauthenticated do
      root to: "devise/sessions#new"
    end
  end 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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

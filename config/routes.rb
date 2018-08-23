Rails.application.routes.draw do
  get 'idea/display_ideas' => "idea#display_ideas"
  get 'idea/:uid/:iid/display_idea_likes' => "idea#display_idea_likes"
  get 'idea/:id/display_user_details' => "idea#display_user_details"
  get 'idea/:uid/:iid/like_idea' => "idea#like_idea"
  post 'idea/:id/new_idea' => "idea#new_idea"
  post 'idea/display_ideas' => "idea#display_ideas"
  get 'idea/:id/delete_idea' => "idea#delete_idea"

  get 'login' => "login#new_user"
  post 'login/process_registration' => "login#process_registration"
  post 'login/process_login' => "login#process_login"
  post 'login/logout' => "login#logout"
  post 'login/:id/process_edit' => "login#process_edit"
  post 'login/:id/edit_user' => "login#edit_user"



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

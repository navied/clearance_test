Rails.application.routes.draw do
   resources :recipes
   root to: redirect('feed')

   resources :users, controller: :users, only: :create

   get 'feed' => 'feed#index'
   get 'profile' => 'profile#index'
end

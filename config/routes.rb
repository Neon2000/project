Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  get "users/show"
  root 'topics#index'
  get "/posts" => "posts#index"
  resources :usercommentratings
  resources :tags
  resources :topics do
    resources :posts do
      post :status, on: :member
      resources :reviews
      resources :comments  
    end
  end
end

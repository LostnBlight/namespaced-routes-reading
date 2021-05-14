Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  #scope allows us to prefix a block of routes under one grouping.
  #namespace lets is make our route a bit less DRY and gives us the helper admin_ so now its admin_stats_path instead of stats_path.

  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end

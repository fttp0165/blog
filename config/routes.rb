Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/bennyBlog', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "posts#index"
  resources :posts do
    resources :comments,shallow: true,except:[:index,:new,:show]
  end

  get '/show_drafts', to: 'show_drafts#index'
  
end

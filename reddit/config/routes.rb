Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
resources :subs
resource :session, only: [:new, :create, :destroy]
resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

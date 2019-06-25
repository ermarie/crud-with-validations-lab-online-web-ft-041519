Rails.application.routes.draw do
  get 'songs/new'

  get 'songs/create'

  get 'songs/update'

  get 'songs/edit'

  get 'songs/destroy'

  get 'songs/index'

  get 'songs/show'

  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

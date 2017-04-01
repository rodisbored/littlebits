Rails.application.routes.draw do
  resources :inventions, defaults: { format: 'json' }, except: :destroy
  resources :bits, defaults: { format: 'json'}, only: :index

  root to: 'inventions#index'
end

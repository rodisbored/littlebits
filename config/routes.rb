Rails.application.routes.draw do
  resources :inventions, except: :destroy

  root to: 'inventions#index'
end

Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get '/', to: 'homes#top'
  end

  scope module: :public do
    root "homes#top"
    resources :items, only: [:index, :show]
    resources :genres, only: [:show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart/items', to: 'cart_items#delete_all'
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    # registrations: 'admin/registrations'
  }




  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'

  }



end

Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end



  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }




  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'

  }


end

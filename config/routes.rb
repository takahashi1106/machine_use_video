Rails.application.routes.draw do

root "public/homes#top"
get "about" => "public/homes#about"

# 顧客用
# URL /user/sign_up... or sign_in...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#管理者側のルーティング
namespace :admin do
  resources :users,only:[:index, :edit, :show] do
  end

  resources :machines,only: [:new, :create, :index ,:show, :edit, :update] do
  end

  resources :genres,only: [:index, :create ,:edit, :update] do
  end
end

#顧客側のルーティング
scope module: :public do
  resources :users,only:[:show, :edit, :update] do
    member do #idが必要なため、member
    get   :like #ユーザーのいいね一覧
    get   :unsubscribe
    patch :withdraw
  end
  end

  resources :machines,only: [:index ,:show] do
    collection do
    get 'search'
  end
    resource :favorites, only: [:create, :destroy]
      resources :machine_comments, only: [:create, :destroy]
  end

   resources :genres,only: [:show] do
  end

  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

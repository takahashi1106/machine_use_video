Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'machines/index'
    get 'machines/new'
    get 'machines/create'
    get 'machines/show'
    get 'machines/edit'
    get 'machines/update'
  end
  namespace :admin do
    get 'users/index'
    get 'users/edit'
    get 'users/show'
  end
  namespace :public do
    get 'genres/show'
  end
  namespace :public do
    get 'machine_comments/create'
  end
  namespace :public do
    get 'machines/index'
    get 'machines/show'
  end
  namespace :public do
    get 'users/show'
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

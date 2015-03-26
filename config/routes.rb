Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  resources :questions, only: [
    :index, :show, :new, :edit, :create, :update, :destroy
  ] do
    resources :answers, only: [:create]
  end
end

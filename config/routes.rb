Rails.application.routes.draw do
  root 'staticpages#landing' #link to static landing page
  get 'thanks', to: 'staticpages#thanks' #link to static thankyou page
  get 'confirmed', to: 'staticpages#confirmed' #link to static confirmed page
  devise_for :users, controllers: { sessions: "users/sessions", confirmations: "users/confirmations" }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :staticpages
  resources :moreinfos
  resources :users
end

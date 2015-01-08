Rails.application.routes.draw do
  


  root 'staticpages#landing' #link to static landing page
  get 'thanks', to: 'staticpages#thanks' #link to static thankyou page
  get 'confirmed', to: 'staticpages#confirmed' #link to static confirmed page
  devise_for :users, controllers: { sessions: "users/sessions", confirmations: "users/confirmations", registrations: "users/registrations" }

    

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  
  resources :moreinfos
  resources :comments
  resources :users do
    resources :linkcats
    resources :wlinks
    resources :finds, :path_names => { :new => 'search'}
    member do
      get 'dashboard'
    end  
  end  
  resources :wlinks
  resources :linkcats do
    resources :finds
  end  
  resources :finds

  namespace :admin do
    resources :users do
      member do
        get 'dashboard'
      end
    end    
    resources :linkcats
    resources :wlinks
    resources :finds
  end  
  
end

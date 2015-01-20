Rails.application.routes.draw do
  


  root 'staticpages#landing' #link to static landing page
  get 'thanks', to: 'staticpages#thanks' #link to static thankyou page
  get 'registerthanks', to: 'staticpages#thanks2'
  get 'confirmed', to: 'staticpages#confirmed' #link to static confirmed page
  get 'legal', to: 'staticpages#legal' #link to static confirmed page
  get 'content', to: 'staticpages#content' #link to static confirmed page
  get 'contactus', to: 'staticpages#contactus' #link to static confirmed page
  get 'howitworks', to: 'staticpages#howitworks' #link to static confirmed page
  get 'aboutus', to: 'staticpages#aboutus' #link to static confirmed page

  get 'reset', to: 'staticpages#reset' #link to static confirmed page
  get 'broken', to: 'admin/wlinks#brokenlinks'


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

Rails.application.routes.draw do
 # GET  /about
  get "about",to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  #get "sign_up", to: "registrations#new"
  #post "sign_up", to: "registrations#create"
  resources :jseeker do
    
    resources :job do
      resources :applied_for
    end
  end
  
  resources :user do
    resources :jobs, only: [:index, :create, :new,:show]
  end

  get "status", to: "jseeker#status"
 

#resources :applied_fors

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  ###########################################################
  get "about",to: "about#index"

  get "password1", to: "passwords1#edit", as: :edit_password1
  patch "password1", to: "passwords1#update"
  #get "sign_up1", to: "registrationjs#new"
  #post "sign_up1", to: "registrationjs#create"

  get "sign_in1", to: "sessions1#new"
  post "sign_in1", to: "sessions1#create"

  delete "logout1", to: "sessions1#destroy"

  get "password1/reset1", to: "password_resets1#new"
  post "password1/reset1", to: "password_resets1#create"

  get "password1/reset1/edit1", to: "password_resets1#edit"
  patch "password1/reset1/edit1", to: "password_resets1#update"
 # get "/",to: "main#index"
  root to: "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

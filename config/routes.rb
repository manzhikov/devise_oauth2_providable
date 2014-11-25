Devise::Oauth2Providable::Engine.routes.draw do
  root :to => "authorizations#new"

  resources :authorizations, :only => [:create, :index]
  get 'authorize' => 'authorizations#new'
  resource :token, :only => :create
end

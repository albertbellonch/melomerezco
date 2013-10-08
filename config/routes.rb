Melomerezco::Application.routes.draw do
  # Devise
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  # Home
  root to: 'home#index'
end

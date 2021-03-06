Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
  resources :events, only: [:index, :create ]
  resources :posts, only: [:index, :create]

  post 'send' => 'events#send_message'
  get 'search' => 'posts#search'
  post 'sms' => 'posts#sms'
  post 'summary' => 'posts#summary'
end

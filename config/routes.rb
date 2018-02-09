Rails.application.routes.draw do
  resources :contacts
  root to: 'visitors#new'
end

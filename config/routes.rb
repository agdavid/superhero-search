Rails.application.routes.draw do
  root 'superheros#home'
  resources :superheros
end

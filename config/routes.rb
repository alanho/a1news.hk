Rails.application.routes.draw do
  root :to => 'covers#index' 
  resources :covers, :only => [:index, :show]
end

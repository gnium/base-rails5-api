# config/routes.rb
Rails.application.routes.draw do
  get ':id' => 'catalog#view'
  resources :urls do
    
  end
end
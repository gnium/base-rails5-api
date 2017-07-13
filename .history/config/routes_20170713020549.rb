# config/routes.rb
Rails.application.routes.draw do
  get ':code' => 'catalog#view'
  resources :urls do
    
  end
end
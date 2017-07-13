# config/routes.rb
Rails.application.routes.draw do
  get ':code' => 'urls#show_by_code'
  resources :urls do
    
  end
end
# config/routes.rb
Rails.application.routes.draw do
  
  resources :urls do    
  end
  get ':code' => 'urls#show_by_code'
end
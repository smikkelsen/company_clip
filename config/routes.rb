CompanyClip::Application.routes.draw do

  root :to => 'ips#show'
  resources :ips

end

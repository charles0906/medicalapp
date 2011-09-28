Medicalapp::Application.routes.draw do
  resources :people
  get 'home/index'
  devise_for :users
  root :to => 'home#index'
  match 'patients/:typeper'=>'People#index', :as => 'patients'
 
end

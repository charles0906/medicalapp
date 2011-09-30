Medicalapp::Application.routes.draw do
  resources :recurrences

  resources :walls

  resources :appointments

  resources :people
  get 'home/index'
  devise_for :users
  root :to => 'home#index'
  match 'typepeople/:typeper'=>'People#index', :as => 'typepeople' 
  #match '/adddoctor' =>'People#adddoctor',:as=>'adddoctor'
  #match '/new_user_doctor' => 'User#create', :as=>'new_user_doctor'
  #match '/users' => 'User#index', :as=>'users'
  #match '/edit_user/:id' => 'User#edit', :as=>'edit_user'
  #match '/update_user' => 'User#update', :as=>'update_user'
  resources :users
  match '/create_user' =>'Users#create',:as=>'create_user'
  match 'new_appointment_with_doctor/:doctor_id'=>'Appointments#new', :as => 'new_appointment_with_doctor'
  match 'cancel_appointment/:appointment_id'=>'Appointments#cancel', :as => 'cancel_appointment'
  match '/help',    :to => 'home#help'

 
end

Rails.application.routes.draw do
  devise_for :users
  resources :jobs, :job_applications
  root to: "jobs#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

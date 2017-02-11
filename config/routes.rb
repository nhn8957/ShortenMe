Rails.application.routes.draw do
  resources :urls

  root 'urls#new'
  get '/:request' => 'urls#redirect'
  get '/:request/stat' => 'urls#stat'

end

Scavenger::Application.routes.draw do
  resources :dataset_entities
  resources :dataset_fields
  resources :datasets
  match '/' => 'dataset_entities#index'
  match '/:controller(/:action(/:id))'
end

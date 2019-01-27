Rails.application.routes.draw do
  root to: 'links#index'

  get '/:short_url' => "links#show"
  resources :links

  match '*path', to: 'application#not_found', via: %i[get post put patch delete]
end

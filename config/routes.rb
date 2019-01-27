Rails.application.routes.draw do
  root to: 'home#index'

  get '/:short_url' => "links#show"

  match '*path', to: 'application#not_found', via: %i[get post put patch delete]
end

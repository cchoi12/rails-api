Rails.application.routes.draw do
  concern :api_base do
    resources :doctors do
      resources :comments
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end

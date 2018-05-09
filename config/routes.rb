# == Route Map
#
#             Prefix Verb   URI Pattern                                   Controller#Action
# v1_doctor_comments GET    /v1/doctors/:doctor_id/comments(.:format)     v1/comments#index
#                    POST   /v1/doctors/:doctor_id/comments(.:format)     v1/comments#create
#  v1_doctor_comment GET    /v1/doctors/:doctor_id/comments/:id(.:format) v1/comments#show
#                    PATCH  /v1/doctors/:doctor_id/comments/:id(.:format) v1/comments#update
#                    PUT    /v1/doctors/:doctor_id/comments/:id(.:format) v1/comments#update
#                    DELETE /v1/doctors/:doctor_id/comments/:id(.:format) v1/comments#destroy
#         v1_doctors GET    /v1/doctors(.:format)                         v1/doctors#index
#          v1_doctor GET    /v1/doctors/:id(.:format)                     v1/doctors#show

Rails.application.routes.draw do
  concern :api_base do
    resources :doctors, only: [:show, :index] do
      resources :comments
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end

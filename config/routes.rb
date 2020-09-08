# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('/orders')

  resources :orders, only: %i[index create update]
end

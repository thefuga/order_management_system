# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders, only: %i[index create update]
end

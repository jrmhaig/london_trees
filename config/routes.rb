# frozen_string_literal: true

Rails.application.routes.draw do
  resources :trees, only: :index
  resources :boroughs, only: :index
  # resources :species
  # resources :genera
end
